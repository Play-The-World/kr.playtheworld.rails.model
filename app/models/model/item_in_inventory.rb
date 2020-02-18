module Model
  class ItemInInventory < ApplicationRecord
    # Relations
    belongs_to :item
    belongs_to :inventory
  end
end
