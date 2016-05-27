class Repository
  attr_accessor :host, :local_path, :branch_name

  def initialize(host, local_path, branch_name)
    @host = host
    @local_path = local_path
    @branch_name = branch_name
  end
end