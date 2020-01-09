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
  end
end
