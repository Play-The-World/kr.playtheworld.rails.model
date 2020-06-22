module Model::Serializer
  class Hint < Base
    fields  :type,
            :order,
            :content

    # view :images do
    #   fields :caution
    # end

    association :images, blueprint: Image
  end
end