module Model::Serializer
  class Maker < Base
    view :base do
      fields  :user_id,
              :status,
              :content,
              :name
      
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