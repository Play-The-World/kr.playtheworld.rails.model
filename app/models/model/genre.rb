module Model
  class Genre < ApplicationRecord
    # Translations
    include Model::Translatable
    translates :title

    # Relations
    has_many :super_themes, class_name: Model.config.super_theme.class_name, dependent: :nullify
    
    def self.serializer
      Model::Serializer::Genre
    end
  end
end
