module Model
  class ItemInInventory < ApplicationRecord
    # Relations
    belongs_to :item
    belongs_to :inventory

    def self.serializer
      Model::Serializer::ItemInInventory
    end
  end
end
