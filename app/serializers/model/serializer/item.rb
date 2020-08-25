module Model::Serializer
  class Item < Base
    view :base do
      fields  :theme_data_id,
              :level,
              :title,
              :content,
              :stage_id
      
      # Relations
      association :images, blueprint: Image
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