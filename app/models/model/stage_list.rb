module Model
  class StageList < ApplicationRecord
    # Translations
    include Model::Translatable
    translates :title, :content
    
    # Relations
    belongs_to :theme
    has_many :stages, dependent: :destroy

  end
end
