class CreateModelItemInInventories < ActiveRecord::Migration[6.0]
  def change
    create_table :model_item_in_inventories do |t|
      # Relations
      t.references :item
      t.references :inventory

      # Attirbutes
      t.integer :count, default: -1

      t.timestamps
    end
  end
end
