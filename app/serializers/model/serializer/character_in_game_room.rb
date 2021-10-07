module Model::Serializer
  class CharacterInGameRoom < Base
    view :base do
      fields :character_id, :game_room_id, :user_id
      
      # Relations
      # association :images, blueprint: Image
    end

    view :play do
      include_view :base
    end

    view :character do
      include_view :base
      association :character, blueprint: Character, view: :base
    end

    view :making do
      include_view :base
      # association :branches, blueprint: Branch, view: :making
    end
  end
end