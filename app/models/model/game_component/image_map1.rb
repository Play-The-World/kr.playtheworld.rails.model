module Model::GameComponent
  class ImageMap1 < Base
    # TYPE
    # default, click

    def maps=(values = [])
      @options[:maps] = values.map(&:to_json)
    end

    def maps
      @options.symbolize_keys[:maps].map { |v| Map.new(v) }
    rescue
      []
    end

    class Map
      attr_accessor :shape, :coords, :image_order, :click_count, :answer, :next_image_order

      # SHAPES
      # entire, rect, circle, poly

      def initialize(values)
        if values.is_a?(String)
          v = JSON.parse(values).symbolize_keys
        else
          v = values.symbolize_keys
        end
        @shape = v[:shape]
        @coords = v[:coords]
        @image_order = v[:image_order]
        @click_count = v[:click_count]
        @answer = v[:answer]
        @next_image_order = v[:next_image_order]
      end

      def to_json
        {
          shape: @shape,
          coords: @coords,
          image_order: @image_order,
          click_count: @click_count,
          answer: @answer,
          next_image_order: @next_image_order
        }.select { |k ,v| v }.to_json
      end
    end
  end
end