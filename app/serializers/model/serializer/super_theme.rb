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

    view :classifications do
      association :locations, blueprint: Location
      association :genres, blueprint: Genre
      association :categories, blueprint: Category
    end
      
    view :images do
      include_view :classifications
      association :images, blueprint: Image
    end

    view :in_topic do
      include_view :images
    end

    view :detail do
      include_view :images
      association :themes, blueprint: Theme
    end
  end
end