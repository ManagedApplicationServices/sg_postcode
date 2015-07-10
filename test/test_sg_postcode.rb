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
        .convert

    assert_kind_of Array, array_convert
    assert_equal 2, array_convert.count
    assert_operator array_convert.first, :key?, :format_address
  end
end
