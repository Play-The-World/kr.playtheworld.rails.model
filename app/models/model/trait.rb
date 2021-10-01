module Model
  class Trait < ApplicationRecord
    # Relations
    belongs_to :super_theme, class_name: Model.config.super_theme.class_name
    has_many :trait_in_characters, dependent: :destroy
    include Model::GameStatsable
    include Model::Imageable
    has_many :trait_in_character_in_game_rooms, dependent: :destroy
  end
end
