module Model::Serializer
  class Image < Base
    view :base do
      fields  :type,
              :value,
              :order,
              :imageable_id,
              :imageable_type,
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