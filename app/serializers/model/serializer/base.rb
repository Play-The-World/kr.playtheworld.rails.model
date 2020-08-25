module Model::Serializer
  class Base < Blueprinter::Base
    identifier :id

    field :model_type do |model|
      model.class.to_s
    end
  end
end