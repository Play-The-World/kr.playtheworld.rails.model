module Model::Serializer
  class Post < Base
    view :base do
      fields  :type,
              :status,
              :title,
              :content,
              :created_at,
              :updated_at
    end
    
    view :show do
      include_view :base
    end
  end
end