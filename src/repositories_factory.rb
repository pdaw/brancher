require 'yaml'
require_relative 'repository'
require_relative 'config_not_found'
require_relative 'config_structure_invalid'

class RepositoriesFactory
  attr_accessor :repositories, :config_file_location

  def initialize(config_file_location = File.expand_path('../config.yml', File.dirname(__FILE__)))
    @config_file_location = config_file_location
    @repositories = []
  end

  def create
    parse
    @repositories
  end

  private

  def parse
    begin
      @config_file = YAML.load_file(config_file_location)

      parse_repositories
    rescue Errno::ENOENT
      raise ConfigNotFound, 'You should create ', config_file_location
    end
  end

  def parse_repositories
    repositories = @config_file['repositories']
    paths = @config_file['paths']
    remotes = @config_file['remotes']

    begin
      repositories.each do |key, value|
        @repositories.push(
            Repository.new(
                remotes[key]['host'],
                paths[key],
                remotes[key]['path'],
                value['branch']
            )
        )
      end
    rescue NoMethodError
      raise ConfigStructureInvalid, 'Your config structure is invalid'
    end
  end
end