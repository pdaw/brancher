require_relative 'repositories_factory'
require_relative 'files_synchronization'

class EnvSwitch
  def initialize
    @files_synchronization = FilesSynchronization.new
  end

  def switch
    repositories_factory = RepositoriesFactory.new
    repositories = repositories_factory.create
    repositories.each do |repository|
      @files_synchronization.synchronize(repository)
    end
  end
end