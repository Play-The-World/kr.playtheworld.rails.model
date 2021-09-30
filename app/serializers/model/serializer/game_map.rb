module Model::Serializer
  class GameMap < Base
    view :base do
      fields :title, :content, :super_theme_id, :order, :width, :height, :searchable
      # field :users_count do |a|
      #   a.entries.size
      # end
      # Relations
      association :images, blueprint: Image, view: :base
      association :map_areas, blueprint: MapArea, view: :base
    end

    # view :play do
    #   include_view :base
    #   association :team, blueprint: Team, view: :play
    #   association :entries, blueprint: Entry, view: :play
    # end

    # view :crime do
    #   include_view :play
    #   association :character_in_game_rooms, blueprint: CharacterInGameRoom, view: :base
    # end

    # view :making do
    #   include_view :base
    #   # association :branches, blueprint: Branch, view: :making
    # end
  end
end