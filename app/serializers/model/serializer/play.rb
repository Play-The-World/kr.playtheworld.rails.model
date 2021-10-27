module Model::Serializer
  class Play < Base
    view :base do
      fields  :status,
              :type,
              :user_id,
              :super_play_id,
              :theme_data_id,
              :stage_list_index,
              :stage_index,
              :finished_at,
              :ready
      
      # Relations
      # association :images, blueprint: Image
      # association :super_play, blueprint: SuperPlay, view: :base
    end

    view :simple do
      fields :type, :user_id, :stage_list_index

      field :image_url do |a|
        a.theme_data.poster_image_url
      end

      field :theme_title do |a|
        a.theme_data.title
      end

      field :stage_title do |a|
        a.current_last_stage_list.title
      end
    end

    view :play do
      include_view :base
      association :super_play, blueprint: SuperPlay, view: :base
      association :inventory, blueprint: Inventory, view: :play
      # association :stage_lists, blueprint: StageList, view: :play
      association :tracks, blueprint: Track, view: :play
      association :theme_data, blueprint: ThemeData, view: :play
    end

    view :character do
      include_view :base
      association :user, blueprint: User, view: :base
      # association :character, blueprint: Character, view: :play
      association :character_in_game_room, blueprint: CharacterInGameRoom, view: :character
    end

    view :making do
      include_view :base
      # association :branches, blueprint: Branch, view: :making
    end
  end
end