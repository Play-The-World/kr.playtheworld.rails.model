module Model::Serializer
  class Creation < Base
    view :base do
      fields  :creator_id,
              :creator_type
              # TODO
    end

    view :play do
      # include_view :base
    end

    view :making do
      include_view :base
      # association :branches, blueprint: Branch, view: :making
    end
  end
end