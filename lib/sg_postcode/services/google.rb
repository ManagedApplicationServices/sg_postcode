require 'rest-client'

module SgPostcode
  class Google
    # Request URL
    REQUEST_SERVICE_URL = 'https://maps.googleapis.com/maps/api/geocode/json'

    def initialize(postcode)
      @postcode = postcode
    end

    # Send Request with the postcode included as a params
    #
    # @example
    #   sender = SgPostcode:Google.new('238432')
    #   sender.request
    #
    def request
      RestClient.get REQUEST_SERVICE_URL, { params: { address: @postcode } }
    end
  end
end
