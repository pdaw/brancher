require 'net/ssh'
require 'net/scp'

class Uploader
  def upload(repository)
    host = repository.host
    local_path = repository.local_path
    commands = repository.commands
    blacklist = repository.blacklist

    Net::SSH.start(host.server, host.user, :password => host.password, :port => host.port) do |ssh|
      scp_client = Net::SCP.new(ssh)
      files_to_upload = get_files_to_upload(local_path, blacklist)
      files_to_upload.each do |file|
        scp_client.upload!(local_path + "/#{file}", host.remote_path, :recursive => true) do |ch, name, sent, total|
          puts "#{name}: #{sent}/#{total}"
        end
      end

      commands.each do |command|
        puts ssh.exec!(command)
      end
    end
  end

  private

  def get_files_to_upload(path, blacklist)
    files_to_upload = Dir.entries(path)

    blacklist.each do |file|
      files_to_upload.delete(file)
    end

    files_to_upload
  end
end