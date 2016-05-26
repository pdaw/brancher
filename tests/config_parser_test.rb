require 'test-unit'
require_relative '../src/config_parser'
require_relative '../src/config_not_found'
require_relative '../src/config_structure_invalid'

class ConfigParserTest < Test::Unit::TestCase
  def test_correct_parse
    config_parser = ConfigParser.new(File.dirname(__FILE__) + '/stub.correct_config.yml')
    config_parser.parse
    assert_equal(3, config_parser.repositories.length)
  end

  def test_throw_error_for_non_existing_config_file
    assert_raise ConfigNotFound do
      config_parser = ConfigParser.new('/i_do_not_exist.yml')
      config_parser.parse
    end
  end

  def test_throw_error_for_invalid_config_file
    assert_raise ConfigStructureInvalid do
      config_parser = ConfigParser.new(File.dirname(__FILE__) + '/stub.incorrect_config.yml')
      config_parser.parse
    end
  end


end