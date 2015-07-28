require 'test_helper'

class TestSgPostcode < Minitest::Test
  def setup
    Redis.new.flushall
  end

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
    refute_operator array_convert.first, :key?, :density
    assert_operator array_convert.first, :key?, :format_address
  end

  def test_real_convert_with_density
    array_convert =
      SgPostcode::Array
        .new(['540000'] * 10)
        .convert

    assert_kind_of Array, array_convert
    assert_equal 1, array_convert.count
    assert_operator array_convert.first, :key?, :density
    assert_equal 10, array_convert.first[:density]
  end

  def test_real_convert_with_density2
    array_convert =
      SgPostcode::Array
        .new(['540000', '540000', '210000'])
        .convert

    assert_kind_of Array, array_convert
    assert_equal 2, array_convert.count
    assert_operator array_convert.first, :key?, :density
    assert_equal 2, array_convert.first[:density]
    refute_operator array_convert[1], :key?, :density
  end


  def test_invalid_convert
    array_convert =
      SgPostcode::Array
        .new(['Totally cannot exist', nil])
        .convert

    assert_kind_of Array, array_convert
  end

  def test_convert_with_options
    convert = SgPostcode::Array.new(['238438'], host: :Google)
    assert_kind_of Array, convert.convert
  end

  def test_non_cached
    converter = SgPostcode::Array.new(['238432'], cache: false)
    converter.convert

    redis = Redis.new
    store = SgPostcode::CacheAdapter.class_variable_get :@@hash_name

    assert_equal 0, redis.hkeys(store).length
  end
end
