module Model::Serializer
  class StageList < Base
    view :base do
      fields  :type,
              :theme_data_id,
              :number,
              :title
      
      # Relations
      # association :images, blueprint: Image
    end

    view :play do
      include_view :base

      association :stage_list_type, blueprint: StageListType, view: :play
      association :stages, blueprint: Stage, view: :play
    end

    view :making do
      include_view :base
      # association :branches, blueprint: Branch, view: :making
    end
  end
end