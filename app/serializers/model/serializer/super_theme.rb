module Model::Serializer
  class SuperTheme < Base
    identifier :fake_id, name: :id
    fields  :title,
            :type,
            :status,
            :content,
            :summary,
            :caution,
            :price,
            :play_time,
            :data_size

    view :detail do
      association :images, blueprint: Image
      association :themes, blueprint: Theme
    end
  end
end