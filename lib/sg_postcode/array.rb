module SgPostcode
  class Array
    # Init a new array object
    #
    # @params
    #   - postcodes: array[String] of postcode
    #   - opts: hash of option
    #     + response_type: default is :json, check the response folder
    #     + host: :Google is default, check services folder
    #
    def initialize(postcodes, opts = {})
      @postcodes = postcodes
      @opts = opts
    end

    # Convert to a long lat array
    #
    # @return [{ long: '123456', lat: '123456' }, ...]
    #
    # @params
    #   opts: list of options from #initializer
    #
    # @example
    # SgPostcode::Array.new(postcodes).convert
    #
    def convert
      LongLatConverter.new(@postcodes, @opts).convert
    end
  end
end
