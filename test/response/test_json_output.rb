require 'test_helper'
require 'json'

class TestJsonOutput < Minitest::Test
  def setup
    path = File.join(File.dirname(__FILE__), '..', 'sample_response.json')
    @file = File.read path
    @json = JSON.parse(@file)
  end

  def test_data
    response = SgPostcode::Response.new(@file)
    assert_equal response.data, @json
  end
end
