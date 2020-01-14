class CreateModelImages < ActiveRecord::Migration[6.0]
  def change
    create_table :model_images do |t|
      # Relations
      t.references :imageable, polymorphic: true

      # Attributes
      t.string :image_type
      t.integer :order, default: 1
      
      t.timestamps

      # Indexes
      t.index [:imageable, :image_type, :order], unique: true
    end
  end
end
