module Model
  module Viewable
    extend ActiveSupport::Concern

    included do
      has_one :view_type, as: :viewable, dependent: :destroy

      # Callbacks
      after_create :create_view_type

      def view_count
        view_type.views.size
      end
    end
  end
end