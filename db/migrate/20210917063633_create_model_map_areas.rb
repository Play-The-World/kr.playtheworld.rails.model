class CreateModelMapAreas < ActiveRecord::Migration[6.1]
  def change
    create_table :model_map_areas do |t|
      # Relations
      t.references :game_map

      # Attributes
      t.string :type
      t.string :shape
      t.string :coords
      t.string :value
      t.integer :click_count, default: 1

      t.timestamps
    end
  end
end
