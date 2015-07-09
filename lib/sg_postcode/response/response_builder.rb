module SgPostcode
  module ResponseBuilder
    class Config
      class << self
        def fields
          @fields ||= default_fields
        end

        def default_fields
          {
            format_address: ['formatted_address'],
            lat: ['geometry', 'location', 'lat'],
            long: ['geometry', 'location', 'long'],
          }
        end
      end
    end

    class Builder
      def initialize(raw_data)
        @raw_data = raw_data
      end

      def raw_data
        @raw_data
      end

      def data
        result = {}

        Config.fields.each do |key, value|
          result[key] = digg value
        end

        result
      end

      def digg(key_path)
        key_path.inject(@raw_data) do |result, key|
          (result.respond_to?(:[]) && (result[key] || {})) || break
        end
      end
    end
  end
end
