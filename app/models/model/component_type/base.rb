module Model
  module ComponentType
    class Base
      attr_reader :options

      def initialize(options = nil)
        @options = options
      end

      class << self
        # Load serialized data into the model scope with our expected transformation.
        # @return [Self] The instance of Self from cleaned out string data. 
        def load(data)
          # Make sure data is compliant with our expected data format
          json = JSON.parse(data)
          json["class_name"].constantize.new(json["options"])
        rescue
          self.new
        end

        # Dump the instance into the storable (serialized) format.
        # @return [String] The transformed string representation of the data.
        def dump(data)
          data.to_s
        end
      end

      def to_s
        {
          class_name: self.class.to_s,
          options: nil
        }.to_json
      end
    end
  end
end