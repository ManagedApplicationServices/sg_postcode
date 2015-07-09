require 'test_helper'

class TestLongLatConverter < Minitest::Test
  def test_send_request
    SgPostcode::LongLatConverter.place_info(nil)
  end

  def test_send_geo_request
    result = SgPostcode::LongLatConverter.send_geo_request("23000", host: :NotExist)
    p result

    refute_equal nil, result
  end
end
