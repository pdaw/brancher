require 'net/scp'

class Uploader
  def initialize
    @files_blacklist = %w(.git . ..)
  end

  def upload(repository)
    host = repository.host
    local_path = repository.local_path

    Net::SCP.start(host.server, host.user, :password => host.password, :port => host.port) do |scp|
      files_to_upload = get_files_to_upload(local_path)
      files_to_upload.each do |file|
        scp.upload!(local_path + "/#{file}", host.remote_path, :recursive => true) do |ch, name, sent, total|
          puts "#{name}: #{sent}/#{total}"
        end
      end
    end
  end

  private

  def get_files_to_upload(path)
    files_to_upload = Dir.entries(path).select do |f|
      File.directory?(f) || File.file?(f)
    end

    @files_blacklist.each do |file|
      files_to_upload.delete(file)
    end

    files_to_upload
  end
end