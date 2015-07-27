require 'test_helper'

class TestConfig < Minitest::Test
  def setup
    SgPostcode::ResponseBuilder::Config.class_variable_set :@@fields, SgPostcode::ResponseBuilder::Config.default_fields
  end

  def test_default_fields
    assert_equal 3, SgPostcode::ResponseBuilder::Config.fields.keys.count
  end

  def add_key
    SgPostcode::ResponseBuilder::Config.add_key_path(:test, 'first', 'second')
  end

  def test_add_key_path
    add_key
    assert_equal 4, SgPostcode::ResponseBuilder::Config.fields.keys.count
    assert_operator SgPostcode::ResponseBuilder::Config.fields.keys, :include?, :test
  end
end
