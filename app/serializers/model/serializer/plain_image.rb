module Model::Serializer
  class PlainImage < Base
    fields :url, :content_type, :filename, :filesize
  end
end