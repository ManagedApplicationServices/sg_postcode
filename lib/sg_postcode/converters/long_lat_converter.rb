module SgPostcode
  module LongLatConverter
    # Convert an array of SG Postcode
    #
    # @return an array contains long, lat
    #
    # @params
    #   - postcodes: array[String] of postcode
    #   - opts: options in hash, supports
    #     + response_type: default is :json, check the response folder
    #     + service_provider: :Google is default, check services folder
    #
    # @example
    #  postcodes = ['238432', '247964']
    #  SgPostCode::LongLatConverter.convert(postcodes)
    # TODO options
    def self.convert(postcodes, opts = {})
      postcodes.map { |postcode| place_info(postcode) }
    end

    # Request info from host for a postcode
    #
    # @return hash of info, check
    #  response/config.rb to see the info fields
    #
    # @params: postcode number [String]
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
