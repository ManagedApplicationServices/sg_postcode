require 'json'

module SgPostcode
  class Response
    def initialize(raw_data)
      @raw_data = JSON.parse(raw_data)
    end

    def data
      @raw_data
    end
  end
end
