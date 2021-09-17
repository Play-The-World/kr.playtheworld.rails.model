module Model
  class ClueInInventory < ApplicationRecord
    # Relations
    belongs_to :clue, class_name: Model.config.clue.class_name
    belongs_to :inventory
  end
end
