module Model
  module Topicable
    extend ActiveSupport::Concern

    included do
      attr_accessor :topic_styles
      
      has_many :topicable_in_topics, as: :topicable, dependent: :destroy
      has_many :topics, through: :topicable_in_topics, class_name: Model.config.topic.class_name
    end
  end
end