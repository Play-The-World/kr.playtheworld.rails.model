module Model
  class TopicInSetting < ApplicationRecord
    # Relations
    belongs_to :setting, counter_cache: :topics_count
    belongs_to :topic, class_name: Model.config.topic.class_name
  end
end
