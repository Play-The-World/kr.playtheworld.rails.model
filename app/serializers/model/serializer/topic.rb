module Model::Serializer
  class Topic < Base
    fields  :title,
            :type

    # association :super_themes, blueprint: SuperTheme, name: :super_themes2
    field :objects do |t|
      t.topicable_in_topics.map { |a| a.topicable.as_json(:in_topic) }
    end

    view :normal do
      fields :caution
    end
  end
end