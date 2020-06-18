module Model::Serializer
  class Theme < Base
    identifier :fake_id
    fields :content

    view :normal do
      fields :caution
    end
  end
end