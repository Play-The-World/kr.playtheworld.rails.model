module Model
  class Setting < ApplicationRecord
    self.inheritance_column = "not_sti"

    # Relations
    belongs_to :settingable, polymorphic: true
    has_many :topic_in_settings, dependent: :destroy
    has_many :topics, through: :topic_in_settings, class_name: Model.config.topic.class_name
    # has_many :topics, -> { order('topic_in_settings.order': :asc) }, through: :topic_in_settings, class_name: Model.config.topic.class_name
    include Model::HasVariables

    # Enums
    # extend Enumerize
    # enumerize :type, in: %i(default newbie), default: :default

    def self.serializer
      Model::Serializer::Setting
    end

    def banners
      topics
        .includes(
          super_themes: {
            genres: [:translations],
            locations: [:translations],
            categories: [:translations],
            # classifications: {
            #   classifier: {}
            # },
            images: {},
            translations: {}
          },
          translations: {}
        )
        # .with_translations
        .select { |t| t.is_a?(Model::Topic::Banner) }
        # .map { |t| t.super_themes }
        # .flatten
    end
  end
end
