module Model::Serializer
  class Image < Base
    fields  :type,
            :order,
            :url
    
    view :detail do
      fields :store_type, :value
    end
  end
end