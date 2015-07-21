require 'test_helper'

class TestCacheAdapter < Minitest::Test
  def setup
    @cache_adapter = SgPostcode::CacheAdapter.new(nil)
  end

  def test_value_of_empty_key
    assert_equal nil, @cache_adapter.value_of('test')
  end

  def test_value_of_valid_key
    @cache_adapter.store('valid_key', 'test_value')
    assert_equal 'test_value', @cache_adapter.value_of('valid_key')
  end

  def test_store_value
    assert_equal 'test_value', @cache_adapter.store('valid_key1', 'test_value')
    assert_equal 'test_value', @cache_adapter.value_of('valid_key1')
  end

  def teardown
    cache_object = @cache_adapter.instance_variable_get(:@cache)
    fields = cache_object.hkeys(SgPostcode::CacheAdapter.instance_variable_get(:@keys))
    hash_name = SgPostcode::CacheAdapter.instance_variable_get(:@hash_name)
    fields.each do |field|
      cache_object.hdel(hash_name, field)
    end
    assert_equal 0, cache_object.hlen(hash_name)
  end
end
