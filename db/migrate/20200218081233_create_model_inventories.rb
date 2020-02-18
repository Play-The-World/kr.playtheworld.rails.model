class CreateModelInventories < ActiveRecord::Migration[6.0]
  def change
    create_table :model_inventories do |t|
      # Relations
      t.references :play

      # Atrributes
      t.integer :space, default: 9

      t.timestamps
    end
  end
end
