module Model::Serializer
  class ItemInInventory < Base
    view :base do
      fields  :item_id,
              :inventory_id,
              :count
      
      # Relations
      # association :images, blueprint: Image
    end

    view :play do
      include_view :base

      association :item, blueprint: Item, view: :play
    end

    view :making do
      include_view :base
      # association :branches, blueprint: Branch, view: :making
    end
  end
end