module Model::Serializer
  class Play < Base
    fields  :stage_list_index,
            :stage_index,
            :status,
            :type,
            :finished_at

    # view :normal do
    #   fields :caution
    # end
    view :playing do
      association :theme_data, blueprint: ThemeData
      association :stage_lists, blueprint: StageList, view: :stages
    end
  end
end