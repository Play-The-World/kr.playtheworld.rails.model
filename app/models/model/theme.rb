module Model
  class Theme < ApplicationRecord
    # Translations
    include Model::Translatable
    translates :content, :caution

    # Status
    include Model::HasStatus
    set_status %i(hidden blocked)

    # Relations
    belongs_to :super_theme
    has_many :stage_lists, dependent: :destroy

    # Callbacks
    before_validation :set_theme_type

    # Validations
    DIFFICULTIES = %w(easy normal hard)
    validates :theme_type, 
      inclusion: { in: DIFFICULTIES, message: "%{value} is not a valid difficulty" }, 
      if: -> { super_theme.themes_type == :difficulty }
    validates :theme_type,
      uniqueness: { scope: :super_theme_id, message: "should be unique to super_theme" }

    private
      def set_theme_type
        case super_theme.themes_type
        when :numbered
          self.theme_type = self.theme_type.to_i.to_s

        end
      end
  end
end
