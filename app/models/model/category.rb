module Model
  class Category < ApplicationRecord
    # Translations
    include Model::Translatable
    translates :title

    # Relations
    has_many :super_themes, class_name: "Model::SuperThemes::SuperTheme", dependent: :nullify
    
  end
end
