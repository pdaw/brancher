class Host
  attr_accessor :server, :port, :user

  def initialize(server, port, user)
    @server = server
    @port = port
    @user = user
  end
end