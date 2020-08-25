module Model::Serializer
  class Modal < Base
    view :base do
      fields  :type,
              :status,
              :start_date,
              :end_date,
              :title,
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