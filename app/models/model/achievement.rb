module Model
  class Achievement < ApplicationRecord
    # Translations
    include Translatable
    translates :title, :content, :condition_content

    # Relations
    has_many :users_achievements, dependent: :destroy
    has_many :users, through: :users_achievements
    include Model::Imageable
    include Model::Interpolatable
  end
end
