module Model::Serializer
  class Team < Base
    view :base do
      fields  :status,
              :type,
              :name,
              :content,
              :super_plays_count
      
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