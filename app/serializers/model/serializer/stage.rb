module Model::Serializer
  class Stage < Base
    view :base do
      fields  :stage_list_id,
              :type,
              :stage_type,
              :stage_number,
              :order,
              :content
      
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