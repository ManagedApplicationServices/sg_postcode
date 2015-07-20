module SgPostcode
  class Proxy
    attr_reader :service
    attr_reader :cache_adapter

    def initialize(service, cache_adapter)
      @cache_adapter = cache_adapter
      @service = service
    end

    def request
      service.request unless cache_adapter.try :fetch
    end
  end
end
