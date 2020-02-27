module Model
  class Setting < ApplicationRecord
    # Relations
    belongs_to :settingable, polymorphic: true
    has_many :topic_in_settings, dependent: :destroy
    has_many :topics, through: :topic_in_settings, class_name: Model.config.topic.class_name
    # has_many :topics, -> { order('topic_in_settings.order': :asc) }, through: :topic_in_settings, class_name: Model.config.topic.class_name
    include Model::HasVariables
  end
end
