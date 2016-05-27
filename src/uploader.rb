require 'net/scp'

class Uploader
  def upload(host, local_path)
      Net::SCP.upload!(
          host.server, host.user, local_path, host.remote_path,
          :ssh => { :password => host.password, :port => host.port }, :recursive => true
      )
  end
end