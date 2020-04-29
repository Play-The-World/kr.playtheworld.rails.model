module Model
  class Location < ApplicationRecord
    # Translations
    include Model::Translatable
    translates :title

    # Relations
    include Model::Classifier
    # has_many :super_themes, class_name: Model.config.super_theme.class_name, dependent: :nullify
    # has_many :themes, class_name: Model.config.theme.class_name, dependent: :nulify

    def self.serializer
      Model::Serializer::Location
    end
  end
end
