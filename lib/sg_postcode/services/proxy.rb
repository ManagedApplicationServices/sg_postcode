module SgPostcode
  class Proxy
    attr_reader :service, :cache_adapter

    def initialize(service, postcode, cache: true)
      @postcode = postcode

      case service
      when :Google
        @service = Google.new(postcode)
      end

      @cache_adapter = CacheAdapter.new(postcode) if cache
    end

    def request
      return nil unless service

      if cache_adapter
        cache_adapter.fetch || cache_adapter.store(@postcode, service.request)
      else
        service.request
      end
    end
  end
end
