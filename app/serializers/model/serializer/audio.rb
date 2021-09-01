module Model::Serializer
  class Audio < Base
    view :base do
      fields  :audioable_id,
              :audioable_type,
              :type,
              :order,
              :url
      # field :url do |a|
      #   a.value
      # end
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