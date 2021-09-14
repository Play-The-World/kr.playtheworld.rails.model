module Model::Serializer
  class Hint < Base
    view :base do
      fields  :type,
              :content,
              :order,
              :stage_list_id
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