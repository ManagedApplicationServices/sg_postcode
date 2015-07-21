module SgPostcode
  class CacheAdapter
    def initialize(key)
      @cache = Redis.new
      @key = key
      @hash_name = "SgPostcodeCaching"
    end

    def fetch
      value_of @key
    end

    def store(key, value)
      @cache.hset(@hash_name, key, value)
      value
    end

    def value_of(key)
      @cache.hget(@hash_name, key)
    end
  end
end
