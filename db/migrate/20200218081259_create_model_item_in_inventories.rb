class CreateModelItemInInventories < ActiveRecord::Migration[6.0]
  def change
    create_table :model_item_in_inventories do |t|
      # Relations
      t.references :item
      t.references :inventory, index: false

      # Attirbutes
      t.integer :count, default: -1

      t.timestamps

      # Index
      t.index [:inventory_id, :count]
    end
  end
end
