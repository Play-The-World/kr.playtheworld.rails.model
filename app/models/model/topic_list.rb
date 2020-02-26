module Model
  class TopicList < ApplicationRecord
    # Relations
    belongs_to :application, optional: true
    has_many :topic_in_lists, dependent: :destroy
    has_many :topics, through: :topic_in_lists, class_name: Model.config.topic.class_name
    # has_many :topics, -> { order('topic_in_lists.order': :asc) }, through: :topic_in_lists, class_name: Model.config.topic.class_name
  end
end
