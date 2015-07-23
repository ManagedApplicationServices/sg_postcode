require 'simplecov'
SimpleCov.start do
  add_filter "/test/"
end

require File.expand_path("lib/sg_postcode")
require "minitest/autorun"

# Filter out Minitest backtrace while allowing backtrace from other libraries
# to be shown.
Minitest.backtrace_filter = Minitest::BacktraceFilter.new

SgPostcode::CacheAdapter.hash_name = "redis_store_test"
