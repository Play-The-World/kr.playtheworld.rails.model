module Model
  module Topic
    class Base < ApplicationRecord
      # Table Name
      self.table_name = Model.config.topic.table_name

      # Relations
      has_many :topic_in_lists, dependent: :destroy, foreign_key: 'topic_id'
      has_many :topic_lists, through: :topic_in_lists
      has_many :super_theme_in_topics, dependent: :destroy, foreign_key: 'topic_id'
      has_many :super_themes, through: :super_theme_in_topics, class_name: Model.config.super_theme.class_name

      # Translations
      include Model::Translatable
      translates :title
    end
  end
end
