require 'test_helper'

class TestProxy < Minitest::Test
  def setup
    @proxy = SgPostcode::Proxy.new(:Google, "238432", cache: true)
  end

  def test_initialize_new_proxy_object
    assert_kind_of SgPostcode::Proxy, @proxy
    assert_kind_of SgPostcode::Google, @proxy.service
    assert_kind_of SgPostcode::CacheAdapter, @proxy.cache_adapter
  end

  def test_request_a_new_postcode
    @proxy.request

    response = "response"
    @proxy.service.stub :request, response do
      assert_send([@proxy.cache_adapter, :store, "238432", response])
    end
  end

  def test_request_a_exist_postcode
    proxy = SgPostcode::Proxy.new(:Google, "500000", cache: true)

    mock = Minitest::Mock.new
    mock.expect :fetch, "500000"

    proxy.request
    proxy.stub :cache_adapter, mock do
      assert_send([proxy.cache_adapter, :fetch])
    end
  end

  def test_request_only_fetch_from_cache
    proxy = SgPostcode::Proxy.new(:Google, "111111", cache: true)

    mock = Minitest::Mock.new
    mock.expect :fetch, true

    proxy.stub :cache_adapter, mock do
      assert_equal true, proxy.request
    end
  end

  def test_request_send_real_request
    proxy = SgPostcode::Proxy.new(:Google, "111111", cache: true)

    mock = Minitest::Mock.new
    mock.expect :fetch, false
    mock.expect :store, true, [String, String]

    proxy.stub :cache_adapter, mock do
      assert_equal true, proxy.request
    end
  end

  # FIXME: add test for noncached version
  #def test_non_cached
    #nocache_proxy = SgPostcode::Proxy.new(:Google, "238432", cache: false)

    #assert_equal true, nocache_proxy.request
  #end
end
