module Model
  module Viewer
    extend ActiveSupport::Concern

    included do
      has_many: :views, as: :viewer, dependent: :destroy

      def viewed(viewable)
        viewable.viewed_by(self)
      end
    end
  end
end