module SgPostcode
  class CacheAdapter
    @@hash_name = "SgPostcodeCaching"

    # Init a new CacheAdapter object
    #
    # @dependencies: redis
    #
    # Redis.new will get REDIS_URL as host
    # you can customize it by set value for
    # `ENV["REDIS_URL"]`
    #
    # @params
    #   @cache
    #   @key in this context is a postcode
    #
    def initialize(key)
      @cache = Redis.new
      @key = key
    end

    # Redefine @@hash_name (key_name in Redis hash store)
    #
    # @example
    #   SgPostcode::CacheAdapter.hash_name = "test_redis_store"
    #
    def self.hash_name=(hash_name)
      @@hash_name = hash_name
    end

    # Fetch request data from cache
    #
    # TODO: will split #value_of method to sub-class
    # cause Adapter shouldn't call Redis directly
    #
    def fetch
      value_of @key
    end

    # Store new postcode and request_data to Redis
    #
    def store(key, value)
      @cache.hset(@@hash_name, key, value)
      value
    end

    # Get Value of a postcode from Redis Hash Store
    #
    def value_of(key)
      @cache.hget(@@hash_name, key)
    end
  end
end
