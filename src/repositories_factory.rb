require 'yaml'
require_relative 'repository'
require_relative 'host'
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
    connections = @config_file['connections']

    begin
      repositories.each do |key, value|

        connection_name = remotes[key]['connection']

        @repositories.push(
            Repository.new(
                Host.new(
                    connections[connection_name]['host'],
                    connections[connection_name]['port'],
                    connections[connection_name]['user'],
                    connections[connection_name]['password'],
                    remotes[key]['path']
                ),
                paths[key],
                value['branch'],
                value['blacklist'].split(' '),
                value['commands']
            )
        )
      end
    rescue NoMethodError
      raise ConfigStructureInvalid
    end
  end
end