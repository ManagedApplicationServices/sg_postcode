module SgPostcode
  class Array
    def initialize(postcodes, opts = {})
      @postcodes = postcodes
      @opts = opts
    end

    # Convert to a long lat array
    #
    # @return [{ long: '123456', lat: '123456' }, ...]
    #
    # @params
    #   error_ignore: ignore invalid postcode(s)
    #
    # @example
    # SgPostcode::Array.new(postcodes).convert
    #
    def convert(error_ignore = true)
      LongLatConverter.convert(@postcodes, ignore_error: error_ignore)
    end
  end
end
