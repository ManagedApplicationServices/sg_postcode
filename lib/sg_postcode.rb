module SgPostcode
end

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), "sg_postcode"))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), "sg_postcode", "converters"))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), "sg_postcode", "services"))

require "array"
require "google"
require "long_lat_converter"
