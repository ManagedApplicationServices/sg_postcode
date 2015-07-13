require 'test_helper'
require 'json'

class TestResponseBuilder < Minitest::Test
  def setup
    json = {
      'results' => [
        'name' =>  'KevinTran',
        'jobs' => [
          { 'title' =>  'Developer' },
          { 'title' => 'Consultant' }
        ]
      ]
    }

    @builder = SgPostcode::ResponseBuilder::JsonOutput.new(json)
  end

  def test_digg_1st_level
    key_path = ['name']

    assert_equal 'KevinTran', @builder.digg(key_path)
  end

  def test_digg_deeper_level
    key_path = ['jobs', 0, 'title']

    assert_equal 'Developer', @builder.digg(key_path)
  end

  def test_digg_with_invalid_key_path
    key_path = ['jobs', 2, 'title']

    assert_equal({}, @builder.digg(key_path))
  end

  def test_digg_with_other_invalid_key_path1
    key_path = ['jobs', 0, 'title1']

    assert_equal({}, @builder.digg(key_path))
  end

  def test_digg_with_other_invalid_key_path2
    key_path = ['oops']

    assert_equal({}, @builder.digg(key_path))
  end

  def set_up_data_for_test_data
    path = File.join(File.dirname(__FILE__), '..', 'sample_response.json')
    file = File.read path

    @json = JSON.parse(file)
    @builder = SgPostcode::ResponseBuilder::JsonOutput.new(@json)
  end

  def test_data
    set_up_data_for_test_data

    result = @builder.data

    refute_nil result[:format_address]
    refute_nil result[:lat]
    refute_nil result[:long]
  end

  def test_calling_data_method_raise_error
    @abstract_builder = SgPostcode::ResponseBuilder::Builder.new(nil)

    assert_raises(NotImplementedError) { @abstract_builder.data }
  end
end
