module SgPostcode
  class CacheAdapter
    def initialize(cache, *keys)
      @cache = cache
      @keys = keys
    end

    def fetch
      @keys.inject([]) { |key| value_of(key) }
    end

    def value_of(key)
      #TODO
      nil
    end
  end
end
