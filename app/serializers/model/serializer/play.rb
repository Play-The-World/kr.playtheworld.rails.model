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
    end

    view :play do
      include_view :base
    end

    view :making do
      include_view :base
      # association :branches, blueprint: Branch, view: :making
    end
  end
end