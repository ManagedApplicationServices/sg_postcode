require 'test_helper'

class TestSgPostcode < Minitest::Test
  def test_init_new_sg_postcode_array
    postcode_array = SgPostcode::Array.new([])
    assert_kind_of SgPostcode::Array, postcode_array
  end

  def test_convert_to_long_lat_array
    postcode_array = SgPostcode::Array.new([])
    postcode_array.convert
  end

  def test_real_convert
    array_convert =
      SgPostcode::Array
        .new(['546080', '238858'])

    assert_kind_of Array, array_convert.convert
  end
end
