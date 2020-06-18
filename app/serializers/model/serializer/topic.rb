module Model::Serializer
  class Topic < Base
    fields  :title,
            :type

    # association :topicable, blueprint: SuperTheme, name: :super_themes

    view :normal do
      fields :caution
    end
  end
end