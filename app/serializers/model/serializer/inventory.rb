module Model::Serializer
  class Inventory < Base
    view :base do
      fields  :play_id,
              :space
      
      # Relations
      # association :images, blueprint: Image
    end

    view :play do
      include_view :base
      # association :items, blueprint: Item, view: :play
      association :item_in_inventories, blueprint: ItemInInventory, view: :play
      association :clue_in_inventories, blueprint: ClueInInventory, view: :play
    end

    view :making do
      include_view :base
      # association :branches, blueprint: Branch, view: :making
    end
  end
end