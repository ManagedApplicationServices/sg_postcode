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
    # @example
    #  postcodes = ['238432', '247964']
    #  SgPostCode::LongLatConverter.new(postcodes).convert
    #
    def convert
      postcodes
        .uniq
        .map { |postcode| density_of(postcode, place_info(postcode)) }
    end

    # Request info from host for a postcode
    #
    # @return hash of info, check
    #  response/config.rb to see the info fields
    #
    # @params: postcode number [String]
    #
    def place_info(postcode)
      send_geo_request(postcode).data
    end

    # Send request to host, and return the response
    #
    # @return
    #
    # @params
    #   postcode
    #
    # @example
    # SgPostcode::LongLatConverter.send_geo_request("230000")
    #
    def send_geo_request(postcode)
      Response.new(
        response(postcode),
        response_type: :json
      )
    end

    private

    def response(postcode)
      Proxy.new(@host, postcode, cache: @cache).request
    end

    def convert_options(opts)
      @host = class_name(opts[:host]) || :Google
      @response_type = opts[:response_type] || :json
      @cache = opts[:cache].nil? ? true : opts[:cache]
    end

    def class_name(host)
      return nil unless Module.constants.include? host
      host.to_sym
    end

    def density_of(postcode, place_info_result)
      place_info_result.merge density_info(postcode)
    end

    def density_info(postcode)
      density_count(postcode) > 1 ? { density: density_count(postcode) } : {}
    end

    def density_count(postcode)
      postcodes.count postcode
    end
  end
end
