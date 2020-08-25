module Model::Serializer
  class Answer < Base
    view :base do
      fields  :value,
              :type,
              :ordered,
              :case_sensitive
    end

    view :play do
      # include_view :base
    end

    view :making do
      include_view :base
      association :branches, blueprint: Branch, view: :making
    end
  end
end