class CreateModelPlainImages < ActiveRecord::Migration[6.0]
  def change
    create_table :model_plain_images do |t|
      # Attributes
      t.string :content_type
      t.string :filename
      t.integer :filesize
      t.text :value, limit: 700000

      t.timestamps
    end
  end
end
