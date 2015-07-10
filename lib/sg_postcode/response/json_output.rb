module SgPostcode
  module ResponseBuilder
    class JsonOutput < Builder
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
