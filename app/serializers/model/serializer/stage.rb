module Model::Serializer
  class Stage < Base
    view :base do
      fields  :stage_list_id,
              :order,
              :title,
              :content
      
      # Relations
      # association :images, blueprint: Image
    end

    view :play do
      include_view :base

      association :images, blueprint: Image, view: :play
      # association :audios, blueprint: Audio, view: :play
      association :videos, blueprint: Video, view: :play
      # association :texts, blueprint: Text, view: :play
    end

    view :making do
      include_view :base
      # association :branches, blueprint: Branch, view: :making
    end
  end
end