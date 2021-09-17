class CreateModelGameMaps < ActiveRecord::Migration[6.1]
  def change
    create_table :model_game_maps do |t|
      # Relations
      t.references :super_theme

      # Attributes
      t.integer :order, default: 1
      t.string :title
      t.text :content
      t.integer :width
      t.integer :height

      t.timestamps
    end
  end
end
