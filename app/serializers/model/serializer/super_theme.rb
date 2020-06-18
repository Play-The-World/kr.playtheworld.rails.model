module Model::Serializer
  class SuperTheme < Base
    identifier :fake_id
    fields  :title,
            :type,
            :status,
            :content,
            :summary,
            :caution,
            :price,
            :play_time,
            :data_size

    view :with_themes do
      association :themes, blueprint: Theme, view: :normal
    end
  end
end