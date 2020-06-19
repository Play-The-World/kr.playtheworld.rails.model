module Model::Serializer
  class Post < Base
    fields  :type,
            :status,
            :title,
            :content,
            :created_at,
            :updated_at
    
    view :in_topic do
      
    end
  end
end