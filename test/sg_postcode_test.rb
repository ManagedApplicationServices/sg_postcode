require 'test_helper'

class SgPostcodeTest < ActiveSupport::TestCase
  def test_init_new_sg_postcode_array
    postcode_array = SgPostcode::Array.new([])
    assert_kind_of SgPostcode::Array, postcode_array
  end

  def convert_to_long_lat_array
    postcode_array = SgPostcode::Array.new([])
    postcode_array.convert
  end
end
