module Model
  class TraitInCharacterInGameRoom < ApplicationRecord
    # Relations
    belongs_to :character_in_game_rooms
    belongs_to :trait
  end
end
