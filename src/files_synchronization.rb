require_relative 'repositories_factory'
require_relative 'uploader'

class FilesSynchronization
  def initialize
    @uploader = Uploader.new
  end

  def synchronize
    repositories_factory = RepositoriesFactory.new
    repositories = repositories_factory.create
    repositories.each do |repository|
      @uploader.upload(repository.host, repository.local_path)
    end
  end
end