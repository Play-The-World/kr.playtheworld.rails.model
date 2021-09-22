module Model
  class CharacterInGameRoom < ApplicationRecord
    # Relations
    belongs_to :character, class_name: Model.config.character.class_name
    belongs_to :game_room
    belongs_to :user, class_name: Model.config.user.class_name, optional: true
  end
end
