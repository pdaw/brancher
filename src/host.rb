class Host
  attr_accessor :server, :port, :user, :password, :remote_path

  def initialize(server, port, user, password, remote_path)
    @server = server
    @port = port
    @user = user
    @password = password
    @remote_path = remote_path
  end
end