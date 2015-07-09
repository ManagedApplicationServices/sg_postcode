require 'json'

module SgPostcode
  class Response
    def initialize(raw_data, response_type = :json)
      @raw_data = JSON.parse(raw_data)
      @response_type = response_type
    end

    # build the data hash
    # may use Builder object to contruct the output data
    #
    def data
      case @response_type
      when :json
        ResponseBuilder::JsonOutput.new(@raw_data).data
      else
        nil
      end
    end
  end
end
