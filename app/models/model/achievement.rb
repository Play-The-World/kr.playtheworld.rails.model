module Model
  class Achievement < ApplicationRecord
    # Translations
    include Translatable
    translates :title, :content, :condition_content

    # Relations
    belongs_to :object, polymorphic: true
    has_many :users_achievements, dependent: :destroy
    has_many :users, through: :users_achievements, class_name: Model.config.user.class_name
    include Model::Imageable
    include Model::Interpolatable
    include Model::EventTarget

    def self.serializer
      Model::Serializer::Achievement
    end
  end
end
