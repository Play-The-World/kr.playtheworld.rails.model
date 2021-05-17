module Model
  module Imageable
    extend ActiveSupport::Concern

    included do
      has_many :images, as: :imageable, dependent: :destroy

      def image
        images.take
      end

      def selected_image(type)
        images.find { |a| a.type == type.to_s }
      end
      def selected_images(type)
        images.select { |a| a.type == type.to_s }
      end
      def image_url(type)
        selected_image(type)&.url
      end

      def poster_image_url
        image_url(:poster)
      end
      def thumbnail_image_url
        image_url(:thumbnail)
      end
      def background_image_url
        image_url(:background)
      end
    end
  end
end