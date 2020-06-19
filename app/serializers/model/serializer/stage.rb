module Model::Serializer
  class Stage < Base
    fields  :type,
            # :stage_number,
            :order,
            :content

    view :stage_list do
      association :stage_list, blueprint: StageList
    end

    view :images do
      association :images, blueprint: Image
    end
  end
end