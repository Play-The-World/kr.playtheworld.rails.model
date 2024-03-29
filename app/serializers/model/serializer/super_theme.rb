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

    view :show do
      include_view :base
      include_view :classifications
      include_view :images
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
      association :images, blueprint: Image, view: :base
    end

    view :detail do
      include_view :images
      association :themes, blueprint: Theme
    end
  end
end