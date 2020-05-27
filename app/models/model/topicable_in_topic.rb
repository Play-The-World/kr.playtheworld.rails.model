module Model
  class TopicableInTopic < ApplicationRecord
    # Relations
    belongs_to :topicable, polymorphic: true
    belongs_to :topic, class_name: Model.config.topic.class_name
  end
end
