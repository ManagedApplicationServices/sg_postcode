module SgPostcode
  module LongLatConverter
    def self.convert(postcodes, opts = {})
      postcodes.map { |postcode| place_info(postcode) }
    end

    def self.place_info(postcode)
      send_geo_request(postcode, host: :Google).data
    end

    # Send request to host, and return the response
    #
    # @return
    #
    # @params
    #   postcode
    #   host: default is Google
    #
    # @example
    # SgPostcode::LongLatConverter.send_geo_request("230000", host: :Google)
    #
    def self.send_geo_request(postcode, host: :Google)
      return nil if Module.const_defined? host

      Response.new(
        Google.new(postcode).request,
        response_type: :json
      )
    end
  end
end
