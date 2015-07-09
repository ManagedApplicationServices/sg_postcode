module SgPostcode
  module ResponseBuilder
    class Config
      class << self
        def fields
          @fields ||= default_fields
        end

        def add_key_path(key_name, *path)
          #TODO
        end

        def remove_key_path(key_name)
          #TODO
        end

        def default_fields
          {
            format_address: ['formatted_address'],
            lat: ['geometry', 'location', 'lat'],
            long: ['geometry', 'location', 'lng'],
          }
        end
      end
    end
  end
end
