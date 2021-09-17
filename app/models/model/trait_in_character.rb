module Model
  class TraitInCharacter < ApplicationRecord
    # Relations
    belongs_to :trait
    belongs_to :character, class_name: Model.config.character.class_name
  end
end
