module SgPostcode
  module ResponseBuilder
    class JsonOutput < Builder
      # Implement #data from Builder
      #
      # Combine all info fields in Config class to the result
      def data
        result = {}

        Config.fields.each do |key, value|
          result[key] = digg value
        end

        result
      end

      # Get value from a key path
      #
      # @params: key_path - array[String|integer]
      #
      # @return value of a keypath
      #
      # @example
      #   @raw_data =
      #     'results' => [
      #      {
      #        'address' => [
      #          {
      #           'short_name' => '1'
      #          }
      #        ]
      #      }
      #     ]
      #
      #    so the key_path will be
      #    keypath = ['address', 0, 'short_name']
      #
      #    response = SgPostcode::ResponseBuilder::JsonOutput.new(@raw_data)
      #    response.data
      #
      def digg(key_path)
        key_path.inject(@raw_data) do |result, key|
          (result.respond_to?(:[]) && (result[key] || {})) || break
        end
      end
    end
  end
end
