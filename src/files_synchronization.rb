require_relative 'repositories_factory'
require_relative 'uploader'

class FilesSynchronization
  def initialize
    @uploader = Uploader.new
  end

  def synchronize(repository)
    @uploader.upload(repository.host, repository.local_path)
  end
end