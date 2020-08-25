module Model::Serializer
  class StageListType < Base
    view :base do
      fields  :stage_list_id,
              :game_component,
              :chance_count,
              :hints_count
      
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