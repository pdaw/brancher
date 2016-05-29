require 'net/ssh'
require 'net/scp'
require 'ruby-progressbar'

class Uploader
  def upload(repository)
    host = repository.host
    local_path = repository.local_path
    commands = repository.commands
    blacklist = repository.blacklist

    Net::SSH.start(host.server, host.user, :password => host.password, :port => host.port) do |ssh|
      scp_client = Net::SCP.new(ssh)
      files_to_upload = get_files_to_upload(local_path, blacklist)

      total_files = 0
      files_to_upload.each do |file|
        total_files += Dir[File.join(local_path + "/#{file}", '**', '*')].count { |f| File.file?(f) }
      end

      total_files += Dir.entries(local_path).count { |f| File.file?(f) }
      progressbar = ProgressBar.create(:title => 'Upload progress', :total => total_files)

      files_to_upload.each do |file|
        scp_client.upload!(local_path + "/#{file}", host.remote_path, :recursive => true) do |ch, name, sent, total|
          if sent == total
            progressbar.increment
          end
        end
      end

      unless commands.nil?
        commands.each do |command|
          puts ssh.exec!(command)
        end
      end
    end
  end

  private

  def get_files_to_upload(path, blacklist)
    files_to_upload = Dir.entries(path)

    unless blacklist.nil?
      blacklist.each do |file|
        files_to_upload.delete(file)
      end
    end

    files_to_upload
  end
end