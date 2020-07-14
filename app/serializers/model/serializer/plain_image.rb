module Model::Serializer
  class PlainImage < Base
    fields :url, :content_type, :filename, :size
  end
end