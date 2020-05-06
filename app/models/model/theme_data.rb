module Model
  class ThemeData < ApplicationRecord
    # Relations
    belongs_to :theme, class_name: Model.config.theme.class_name
    has_many :stage_lists, dependent: :destroy, foreign_key: "theme_data_id"
    # has_many :super_plays, dependent: :destroy, counter_cache: true, foreign_key: "theme_data_id"
    include Model::Eventable

    # Callbacks
    before_create :set_version

    private
      def set_version
        version = theme.theme_data.size + 1
      end
  end
end
