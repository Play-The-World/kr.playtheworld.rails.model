module Model::Serializer
  class StageList < Base
    view :base do
      fields  :theme_data_id,
              :number,
              :title,
              :type
      
      # Relations
      # association :images, blueprint: Image
    end

    view :play do
      include_view :base

      association :stages, blueprint: Stage, view: :play
    end

    view :making do
      include_view :base
      # association :branches, blueprint: Branch, view: :making
    end
  end
end