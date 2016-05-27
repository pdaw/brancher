require_relative 'repositories_factory'
require_relative 'files_synchronization'
require_relative 'git_checkout'

class EnvSwitch
  def initialize
    @files_synchronization = FilesSynchronization.new
    @git_checkout = GitCheckout.new
  end

  def switch
    repositories_factory = RepositoriesFactory.new
    repositories = repositories_factory.create
    repositories.each do |repository|
      @git_checkout.checkout_branch(repository)
      @files_synchronization.synchronize(repository)
    end
  end
end