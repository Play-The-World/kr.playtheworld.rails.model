module Model
  module Themes
    class Theme < ApplicationRecord
      # Translations
      include Model::Translatable
      translates :content, :caution

      # Status
      include Model::HasStatus
      set_status %i(hidden blocked)

      # Relations
      belongs_to :super_theme
      has_many :stage_lists, class_name: "Model::StageList", dependent: :destroy

      # Callbacks
      before_validation :set_theme_type

      # Validations
      validates :theme_type,
        uniqueness: { scope: :super_theme_id, message: "should be unique to super_theme" }

      protected
        def set_theme_type
          nil
        end
    end
  end
end
