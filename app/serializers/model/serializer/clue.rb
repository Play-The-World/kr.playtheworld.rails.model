module Model::Serializer
  class Clue < Base
    view :base do
      fields  :type, :title, :level, :phase, :super_theme_id
      
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