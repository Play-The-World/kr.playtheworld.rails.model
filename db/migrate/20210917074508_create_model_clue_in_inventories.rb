class CreateModelClueInInventories < ActiveRecord::Migration[6.1]
  def change
    create_table :model_clue_in_inventories do |t|
      # Relations
      t.references :inventory
      t.references :clue

      # Attributes
      t.boolean :shared, default: false

      t.timestamps
    end
  end
end
