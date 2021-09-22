module Model::Serializer
  class GameRoom < Base
    view :base do
      fields  :type,
              :status,
              :title,
              :content,
              :super_theme_id,
              :team_id,
              :max_user_count
      # field :users_count do |a|
      #   a.entries.size
      # end
      # Relations
      # association :images, blueprint: Image
    end

    view :play do
      include_view :base
      association :team, blueprint: Team, view: :play
      association :entries, blueprint: Entry, view: :play
    end

    view :crime do
      include_view :play
      association :character_in_game_rooms, blueprint: CharacterInGameRoom, view: :base
      association :theme_data, blueprint: ThemeData, view: :base
    end

    view :making do
      include_view :base
      # association :branches, blueprint: Branch, view: :making
    end
  end
end