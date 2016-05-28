class Repository
  attr_accessor :host, :local_path, :branch_name, :blacklist

  def initialize(host, local_path, branch_name, blacklist)
    @host = host
    @local_path = local_path
    @branch_name = branch_name
    @blacklist = blacklist
  end
end