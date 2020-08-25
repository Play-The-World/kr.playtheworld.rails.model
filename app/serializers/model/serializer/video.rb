module Model::Serializer
  class Video < Base
    view :base do
      fields  :videoable_id,
              :videoable_type,
              :type,
              # :store_type,
              :value,
              :order,
              :url
      
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