require 'test-unit'
require_relative '../src/repositories_factory'
require_relative '../src/config_not_found'
require_relative '../src/config_structure_invalid'

class RepositoriesFactoryTest < Test::Unit::TestCase
  def test_correct_parse
    factory = RepositoriesFactory.new(File.dirname(__FILE__) + '/stub.correct_config.yml')
    repositories = factory.create
    assert_equal(3, repositories.length)
  end

  def test_throw_error_for_non_existing_config_file
    assert_raise ConfigNotFound do
      factory = RepositoriesFactory.new('/i_do_not_exist.yml')
      factory.create
    end
  end

  def test_throw_error_for_invalid_config_file_without_remote
    assert_raise ConfigStructureInvalid do
      factory = RepositoriesFactory.new(File.dirname(__FILE__) + '/stub.incorrect_config_without_remote.yml')
      factory.create
    end
    end

  def test_throw_error_for_invalid_config_file_without_path
    assert_raise ConfigStructureInvalid do
      factory = RepositoriesFactory.new(File.dirname(__FILE__) + '/stub.incorrect_config_without_path.yml')
      factory.create
    end
    end

  def test_throw_error_for_invalid_config_file_without_connection
    assert_raise ConfigStructureInvalid do
      factory = RepositoriesFactory.new(File.dirname(__FILE__) + '/stub.incorrect_config_without_connection.yml')
      factory.create
    end
  end
end