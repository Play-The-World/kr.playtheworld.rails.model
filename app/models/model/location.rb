module Model
  class Location < ApplicationRecord
    # Relations
    has_many :super_themes, class_name: Model.config.super_theme.class_name, dependent: :nullify
    # has_many :themes, class_name: Model.config.theme.class_name, dependent: :nulify

    # Translations
    include Model::Translatable
    translates :title

    def self.serializer
      Model::Serializer::Location
    end
  end
end
