class CreateModelImages < ActiveRecord::Migration[6.0]
  def change
    create_table :model_images do |t|
      # Relations
      t.references :imageable, polymorphic: true

      # Attributes
      t.string :image_type
      
      t.timestamps

      # Indexes
      t.index :image_type
    end
  end
end
