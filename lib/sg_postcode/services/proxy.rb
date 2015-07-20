module SgPostcode
  class Proxy
    def initialize(cache_engine, service)
      @cache_engine = cache_engine
      @service = service
    end

    def request
      @service.request
    end
  end
end
