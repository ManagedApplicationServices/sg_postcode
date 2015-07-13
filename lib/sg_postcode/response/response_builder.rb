module SgPostcode
  module ResponseBuilder
    class Builder
      attr_reader :raw_data
      # Initialize a new builder
      #
      # All subclass of Builder will inherit this method
      #
      # raw_data must have the 'results', follow is an array
      def initialize(raw_data)
        # FIXME: check if the data is invalid
        @raw_data = raw_data['results'].first
      end

      # Implement this method in the subclass instead
      def data
        raise NotImplementedError
      end
    end
  end
end
