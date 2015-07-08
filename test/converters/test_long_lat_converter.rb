require 'test_helper'

class TestLongLatConverter < Minitest::Test
  def test_send_request
    request = SgPostcode::LongLatConverter.place_info(nil)
  end
end
