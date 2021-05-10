module Model::GameComponent
  class ImageMap1 < Base

    def maps=(values = [])
      @options[:maps] = values.map(&:to_json)
    end

    def maps
      @options[:maps].map { |v| Map.new(v) }
    rescue
      []
    end

    class Map
      attr_accessor :shape, :coord, :image_order, :click_count, :answer, :next_image_order

      # SHAPES
      # entire, rect, circle, poly

      def initialize(values)
        v = values.symbolize_keys
        @shape = v[:shape]
        @coord = v[:coord]
        @image_order = v[:image_order]
        @click_count = v[:click_count]
        @answer = v[:answer]
        @next_image_order = v[:next_image_order]
      end

      def to_json
        {
          shape: @shape,
          coord: @coord,
          image_order: @image_order,
          click_count: @click_count,
          answer: @answer,
          next_image_order: @next_image_order
        }.select { |k ,v| v }.to_json
      end
    end
  end
end