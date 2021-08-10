module Model::Serializer
  class TopicableInTopic < Base
    view :base do
      # fields  :title,
      #         :type
    end

    view :show do
      include_view :base

      field :topicable do |t|
        t.topicable.as_json(:show)
      end

      association :styles, blueprint: Style
    end
  end
end