module Model::Serializer
  class Topic < Base
    view :base do
      fields  :title,
              :type
    end

    view :posts do
      include_view :base

      field :posts do |t|
        t.topicable_in_topics.map { |a| a.topicable.as_json(:show) }
      end
    end

    view :super_themes do
      include_view :base
      
      field :super_themes do |t|
        t.topicable_in_topics.map { |a| a.topicable.as_json(:show) }
      end
    end

    # association :super_themes, blueprint: SuperTheme, name: :super_themes2
    view :normal do
      fields :caution
    end
  end
end