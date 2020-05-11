class CreateModelImages < ActiveRecord::Migration[6.0]
  def change
    create_table :model_images do |t|
      # Relations
      t.references :imageable, polymorphic: true, index: false

      # Attributes
      t.string :type
      t.string :store_type
      t.string :value
      t.integer :order, default: 1
      
      t.timestamps

      # Indexes
      t.index [:imageable_id, :imageable_type, :type, :order], name: "images_index", unique: true
    end
  end
end
