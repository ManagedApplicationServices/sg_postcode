module SgPostcode
end

# Add these path to $LOAD_PATH
#
# so later, instead of writing
#   require 'converters/json_ouput'
# we can use
#   require 'json_ouput'
# cause the converters directory already in $LOAD_PATH
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), "sg_postcode"))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), "sg_postcode", "converters"))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), "sg_postcode", "services"))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), "sg_postcode", "response"))

require "response"
require "response_builder"
require "json_output"
require "config"
require "array"
require "cache_adapter"
require "google"
require "proxy"
require "redis"
require "long_lat_converter"
