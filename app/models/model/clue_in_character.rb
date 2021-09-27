module Model
  class ClueInCharacter < ApplicationRecord
    # Relations
    belongs_to :character, class_name: Model.config.character.class_name
    belongs_to :clue, class_name: Model.config.clue.class_name
  end
end
