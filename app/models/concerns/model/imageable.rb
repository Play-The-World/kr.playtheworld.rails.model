module Model
  module Imageable
    extend ActiveSupport::Concern

    included do
      has_many :images, as: :imageable, dependent: :destroy

      def image
        images.take
      end
    end
  end
end