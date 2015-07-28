module SgPostcode
  module ResponseBuilder
    class Config
      class << self
        # Get all response fields (key_paths)
        def fields
          @@fields ||= default_fields
        end

        # add a custom key_path
        def add_key_path(key_name, *path)
          fields.merge!({ key_name => path })
        end

        # remove a key_path
        #
        # @return nothing if keypath doesn't exist
        #
        def remove_key_path(key_name)
          fields.delete(key_name)
        end

        # default fields (key_paths)
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
