class Repository
  attr_accessor :name, :host, :local_path, :branch_name, :blacklist, :commands

  def initialize(name, host, local_path, branch_name, blacklist = nil, commands = nil)
    @name = name
    @host = host
    @local_path = local_path
    @branch_name = branch_name
    @blacklist = blacklist
    @commands = commands
  end
end