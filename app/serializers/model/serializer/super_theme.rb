module Model::Serializer
  class SuperTheme < Base
    # fields :fake_id
    # identifier :fake_id, name: :id
    
    view :base do
      fields  :title,
              :type,
              :status,
              :content,
              :summary,
              :fake_id
    end

    view :show do
      include_view :base
      include_view :classifications
      include_view :images
      association :themes, blueprint: Theme, view: :show
      # association :topic_styles, blueprint: Style
    end

    view :crime do
      association :characters, blueprint: Character, view: :play
      association :clues, blueprint: Clue, view: :base
      association :game_maps, blueprint: GameMap, view: :base
      association :info_files, blueprint: InfoFile, view: :base
    end

    view :crime_show do
      include_view :show
      include_view :crime
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
      association :themes, blueprint: Theme, view: :show
    end
  end
end