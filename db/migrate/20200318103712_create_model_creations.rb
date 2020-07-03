class CreateModelCreations < ActiveRecord::Migration[6.0]
  def change
    create_table :model_creations do |t|
      # Relations
      t.references :creator, polymorphic: true
      t.references :product, polymorphic: true

      # Attributes
      t.string :type

      t.timestamps
    end
  end
end
