module Model::Serializer
  class Canvas < Base
    view :base do
      fields  :stage_id,
              :value
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