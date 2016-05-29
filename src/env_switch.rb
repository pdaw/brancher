require_relative 'repositories_factory'
require_relative 'action/git'
require_relative 'action/uploader'

class EnvSwitch
  def initialize
    @git_client = Git.new
    @uploader = Uploader.new
  end

  def switch
    repositories_factory = RepositoriesFactory.new
    repositories = repositories_factory.create


    repositories.each do |repository|
      puts "\n ================== Starting #{repository.name} =================="

      @git_client.checkout_branch(repository)
      @uploader.upload(repository)

      puts "Finished #{repository.name}"
    end
  end
end