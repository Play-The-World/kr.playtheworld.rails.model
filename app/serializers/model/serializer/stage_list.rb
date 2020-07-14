module Model::Serializer
  class StageList < Base
    view :base do
      fields  :stage_list_number,
              :type,
              :title
    end

    view :theme_data do
      association :theme_data, blueprint: ThemeData
    end

    view :stages do
      association :stages, blueprint: Stage, view: :images
    end

    view :making do
      fields :title, :type
      field :stageListNo do |a|
        a.stage_list_number
      end
    end
  end
end