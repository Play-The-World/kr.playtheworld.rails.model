module Model
  class Genre < ApplicationRecord
    # Translations
    include Model::Translatable
    translates :title

    # Relations
    has_many :super_themes, dependent: :nullify
    
  end
end
