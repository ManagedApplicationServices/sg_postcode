require 'rest-client'

module SgPostcode
  class Google
    REQUEST_SERVICE_URL = 'https://maps.googleapis.com/maps/api/geocode/json'

    def initialize(postcode)
      @postcode = postcode
    end

    def request
      RestClient.get REQUEST_SERVICE_URL, { params: { address: @postcode } }
    end
  end
end
