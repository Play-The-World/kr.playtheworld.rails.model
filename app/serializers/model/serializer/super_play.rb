module Model::Serializer
  class SuperPlay < Base
    view :base do
      fields  :status,
              :type,
              :team_id,
              :super_theme_id,
              :plays_count
      
      # Relations
      # association :images, blueprint: Image
    end

    view :play do
      include_view :base
    end

    view :crime do
      include_view :base
      association :plays, blueprint: Play, view: :character
    end

    view :making do
      include_view :base
      # association :branches, blueprint: Branch, view: :making
    end
  end
end