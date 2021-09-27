module Model::Serializer
  class MapArea < Base
    view :base do
      fields :type, :shape, :coords, :value, :title, :click_count, :game_map_id
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