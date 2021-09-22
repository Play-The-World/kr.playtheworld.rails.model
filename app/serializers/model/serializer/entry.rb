module Model::Serializer
  class Entry < Base
    view :base do
      fields  :status,
              :entryable_id,
              :entryable_type,
              :user_id,
              :ready
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