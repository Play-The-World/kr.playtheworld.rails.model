module Model
  module RenderType
    # 
    # Render 타입의 기본 클래스
    #
    # == Options
    #
    # * +:o1+ - sth
    #
    class Base
      # 옵션을 담을 Hash 객체
      attr_reader :options

      def initialize(options = nil)
        @options = options || {}
      end

      # def str; "unknown" end

      def to_s
        {
          type: self.class.to_s.split("::").last,
          options: @options
        }.to_json
      end

      # def as_json(options = {}); JSON.parse(to_s) end

      class << self
        # Load serialized data into the model scope with our expected transformation.
        #
        # ==== Return
        #
        # * Self - The instance of Self from cleaned out string data.
        def load(data)
          # Make sure data is compliant with our expected data format
          json = JSON.parse(data)
          "Model::RenderType::#{json["type"]}".constantize.new(json["options"])
        rescue
          self.new
        end

        # Dump the instance into the storable (serialized) format.
        #
        # ==== Return
        #
        # * String - The transformed string representation of the data.
        def dump(data)
          data.to_s
        end
        
        # def to_s
        #   {
        #     class_name: self.class.to_s,
        #     options: nil
        #   }.to_json
        # end
      end
    end
  end
end