module Model::Serializer
  class ThemeData < Base
    view :base do
      fields  :theme_id,
              :version,
              :start_stage_list_number
      
      # Relations
      # association :images, blueprint: Image
    end

    view :play do
      include_view :base
      association :theme, blueprint: Theme, view: :base
    end

    view :making do
      include_view :base
      fields :memo
      # association :branches, blueprint: Branch, view: :making
    end
  end
end