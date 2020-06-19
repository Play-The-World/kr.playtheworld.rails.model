module Model::Serializer
  class StageList < Base
    fields  :stage_list_number,
            :title

    view :normal do
      fields :caution
    end

    view :theme_data do
      association :theme_data, blueprint: ThemeData
    end

    view :stages do
      association :stages, blueprint: Stage, view: :images
    end
  end
end