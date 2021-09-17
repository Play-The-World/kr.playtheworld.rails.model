module Model
  class Trait < ApplicationRecord
    # Relations
    belongs_to :super_theme, class_name: Model.config.super_theme.class_name
    has_many :traits_in_characters, dependent: :destroy
    include Model::GameStatsable
    include Model::Imageable
  end
end
