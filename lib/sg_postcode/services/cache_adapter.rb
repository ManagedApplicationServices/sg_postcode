module SgPostcode
  class CacheAdapter
    @@hash_name = "SgPostcodeCaching"

    def initialize(key)
      @cache = Redis.new
      @key = key
    end

    def self.hash_name=(hash_name)
      @@hash_name = hash_name
    end

    def fetch
      value_of @key
    end

    def store(key, value)
      @cache.hset(@@hash_name, key, value)
      value
    end

    def value_of(key)
      @cache.hget(@@hash_name, key)
    end
  end
end
