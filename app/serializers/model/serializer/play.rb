module Model::Serializer
  class Play < Base
    fields  :stage_list_index,
            :stage_index,
            :status,
            :type,
            :finished_at

    view :normal do
      fields :caution
    end
  end
end