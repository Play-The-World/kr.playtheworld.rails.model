class CreateModelCanvases < ActiveRecord::Migration[6.0]
  def change
    create_table :model_canvases do |t|
      # Relations
      t.references :stage

      # Attributes
      t.text :value

      t.timestamps
    end
  end
end
