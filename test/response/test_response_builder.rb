require 'test_helper'
require 'json'

class TestResponseBuilder < Minitest::Test
  def setup
    json = {
      'name' =>  'KevinTran',
      'jobs' => [
        { 'title' =>  'Developer' },
        { 'title' => 'Consultant' }
      ]
    }

    @builder = SgPostcode::ResponseBuilder::Builder.new(json)
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
end
