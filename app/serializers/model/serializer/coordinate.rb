module Model::Serializer
  class Coordinate < Base
    view :base do
      fields  :type,
              :lat,
              :lng,
              :coordinate_id,
              :coordinate_type
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