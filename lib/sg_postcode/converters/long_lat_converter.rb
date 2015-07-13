module SgPostcode
  class LongLatConverter
    attr_reader :postcodes

    def initialize(postcodes, opts = {})
      @postcodes = postcodes
      convert_options opts
    end

    # Convert an array of SG Postcode
    #
    # @return an array contains long, lat
    #
    # @params
    #   - postcodes: array[String] of postcode
    #   - opts: options in hash, supports
    #     + response_type: default is :json, check the response folder
    #     + host: :Google is default, check services folder
    #
    # @example
    #  postcodes = ['238432', '247964']
    #  SgPostCode::LongLatConverter.convert(postcodes)
    #
    def convert
      postcodes.map { |postcode| place_info(postcode) }
    end

    # Request info from host for a postcode
    #
    # @return hash of info, check
    #  response/config.rb to see the info fields
    #
    # @params: postcode number [String]
    def place_info(postcode)
      send_geo_request(postcode).data
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
    def send_geo_request(postcode)
      return nil if Module.const_defined? @host

      Response.new(
        response(postcode),
        response_type: :json
      )
    end

    private

    def response(postcode)
      case @host
      when :Google
        Google.new(postcode).request
      else
        nil
      end
    end

    def convert_options(opts)
      @host = class_name(opts[:host]) || :Google
      @response_type = opts[:response_type] || :json
    end

    def class_name(host)
      return nil unless Module.constants.include? host
      host.to_sym
    end
  end
end
