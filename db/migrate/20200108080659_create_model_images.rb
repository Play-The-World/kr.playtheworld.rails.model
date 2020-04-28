class CreateModelImages < ActiveRecord::Migration[6.0]
  def change
    create_table :model_images do |t|
      # Relations
      t.references :imageable, polymorphic: true, index: false

      # Attributes
      t.string :image_type
      t.string :store_type, null: false, default: "external"
      t.string :value
      t.integer :order, default: 1
      
      t.timestamps

      # Indexes
      t.index [:imageable_id, :imageable_type, :image_type, :order], name: "images_index", unique: true
    end
  end
end
