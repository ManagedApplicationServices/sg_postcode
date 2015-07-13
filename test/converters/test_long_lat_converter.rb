require 'test_helper'

class TestLongLatConverter < Minitest::Test
  def setup
    @converter = SgPostcode::LongLatConverter.new(nil)
  end

  def test_send_request
    @converter.place_info(nil)
  end

  def test_send_geo_request
    result = @converter.send_geo_request("23000")

    refute_equal nil, result
  end
end
