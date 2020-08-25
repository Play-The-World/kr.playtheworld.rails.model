module Model::Serializer
  class StageList < Base
    view :base do
      fields  :type,
              :theme_data_id,
              :stage_list_number,
              :title
      
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