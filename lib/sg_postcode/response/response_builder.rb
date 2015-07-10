module SgPostcode
  module ResponseBuilder
    class Builder
      def initialize(raw_data)
        @raw_data = raw_data['results'].try(:first)
      end

      def raw_data
        @raw_data
      end

      def data
        raise NotImplementedError
      end
    end
  end
end
