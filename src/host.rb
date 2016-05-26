class Host
  attr_accessor :server, :port, :user

  def initialize(server, port, user, cache_directory)
    @server = server
    @port = port
    @user = user
    @cache_directory = cache_directory
  end
end