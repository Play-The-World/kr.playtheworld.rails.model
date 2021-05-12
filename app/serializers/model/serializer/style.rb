module Model::Serializer
  class Style < Base
    view :base do
      fields  :value,
              :type,
              :name
      
    end
  end
end