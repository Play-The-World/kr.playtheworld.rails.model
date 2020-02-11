module Model
  module Viewable
    extend ActiveSupport::Concern

    included do
      has_one :view_type, as: :viewable, dependent: :destroy

      # Callbacks
      after_create :create_view_type

      # 조회수 => Integer
      def views_count
        view_type.views.size
      rescue
        0
      end

      # 조회
      def viewed_by(viewer)
        view_type.viewed_by(viewer)
      end
    end
  end
end