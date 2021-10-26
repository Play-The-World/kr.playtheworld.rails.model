module Model::Serializer
  class Topic < Base
    view :base do
      fields :title

      field :type do |a|
        a.class.name.split('::').last
      end
    end

    view :banner do
      include_view :base

      # field :super_themes do |t|
      #   t.topicable_in_topics.map { |a|
      #     s = a.topicable
      #     s.topic_styles = t.styles
      #     s.as_json(:show)
      #   }
      # end
      # association :super_themes, blueprint: SuperTheme, view: :show
      association :topicable_in_topics, blueprint: TopicableInTopic, view: :show
      association :styles, blueprint: Style
    end

    # view :posts do
    #   include_view :base

    #   field :posts do |t|
    #     t.topicable_in_topics.map { |a|
    #       a.topicable.as_json(:show)
    #     }
    #   end
    # end

    # association :super_themes, blueprint: SuperTheme, name: :super_themes2
    view :normal do
      fields :caution
    end
  end
end