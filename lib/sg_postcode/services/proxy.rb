module SgPostcode
  class Proxy
    attr_reader :service
    attr_reader :cache_engine

    def initialize(cache_engine, service)
      @cache_engine = cache_engine
      @service = service
    end

    def request
      service.request unless cache_engine.try :fetch
    end
  end
end
