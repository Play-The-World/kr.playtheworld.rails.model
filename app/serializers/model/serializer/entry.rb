module Model::Serializer
  class Entry < Base
    view :base do
      fields  :type,
              :status,
              :team_id,
              :user_id
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