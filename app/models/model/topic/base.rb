module Model
  module Topic
    class Base < ApplicationRecord
      # Table Name
      self.table_name = Model.config.topic.table_name

      # Relations
      has_many :topic_in_settings, dependent: :destroy, foreign_key: 'topic_id'
      has_many :settings, through: :topic_in_settings
      has_many :super_theme_in_topics, dependent: :destroy, foreign_key: 'topic_id'
      has_many :super_themes, through: :super_theme_in_topics, class_name: Model.config.super_theme.class_name
      include Model::Interpolatable

      # Translations
      include Model::Translatable
      translates :title

      def self.serializer
        Model::Serializer::Topic
      end
    end
  end
end
