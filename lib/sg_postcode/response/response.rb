require 'json'

module SgPostcode
  class Response
    def initialize(raw_data)
      @raw_data = JSON.parse(raw_data)
    end

    # build the data hash
    # may use Builder object to contruct the output data
    #
    #
    def data
      @raw_data['results'][0]['formatted_address']
    end
  end
end
