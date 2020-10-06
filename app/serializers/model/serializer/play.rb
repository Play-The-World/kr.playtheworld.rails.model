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
              :finished_at
      
      # Relations
      # association :images, blueprint: Image
      association :super_play, blueprint: SuperPlay, view: :base
    end

    view :play do
      include_view :base
      association :inventory, blueprint: Inventory, view: :play
      # association :stage_lists, blueprint: StageList, view: :play
      association :tracks, blueprint: Track, view: :play
    end

    view :making do
      include_view :base
      # association :branches, blueprint: Branch, view: :making
    end
  end
end