module Model::Serializer
  class A < Base
    fields  :type,
            :status

    view :normal do
      fields :caution
    end
  end
end