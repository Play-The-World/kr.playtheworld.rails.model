module Model
  class PlainTheme < ApplicationRecord
    # Relations
    belongs_to :user, class_name: Model.config.user.class_name

    def self.serializer
      Model::Serializer::PlainTheme
    end
  end
end
