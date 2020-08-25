module Model::Serializer
  class Music < Base
    view :base do
      fields  :musicable_id,
              :musicable_type,
              :type,
              :start_stage_list_id,
              :end_stage_list_id
      
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