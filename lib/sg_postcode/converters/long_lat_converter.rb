module SgPostcode
  module LongLatConverter
    def self.convert(postcodes, opts = {})
    end

    def self.place_info(postcode)
      send_geo_request(postcode, host: SgPostcode::Google)
    end

    def self.send_geo_request(postcode, host: nil)
    end
  end
end
