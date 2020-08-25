module Model::Serializer
  class SuperTheme < Base
    identifier :fake_id, name: :id
    view :base do
      fields  :title,
              :type,
              :status,
              :content,
              :summary
    end

    view :play do
      include_view :base
    end

    view :making do
      include_view :base
    end

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