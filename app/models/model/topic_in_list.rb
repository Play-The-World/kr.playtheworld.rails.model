module Model
  class TopicInList < ApplicationRecord
    # Relations
    belongs_to :topic_list
    belongs_to :topic, class_name: Model.config.topic.class_name
  end
end
