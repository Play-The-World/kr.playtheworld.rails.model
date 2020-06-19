module Model::Serializer
  class ThemeData < Base
    fields  :version,
            :start_stage_list_number

    view :theme do
      association :theme, blueprint: Theme
    end

    view :stage_lists do
      association :stage_lists, blueprint: StageList
    end

    view :detail do
      fields :memo
    end
  end
end