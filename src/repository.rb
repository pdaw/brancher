class Repository
  attr_accessor :host, :local_path, :branch_name, :blacklist, :commands

  def initialize(host, local_path, branch_name, blacklist = nil, commands = nil)
    @host = host
    @local_path = local_path
    @branch_name = branch_name
    @blacklist = blacklist
    @commands = commands
  end
end