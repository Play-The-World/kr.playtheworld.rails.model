class CreateModelPlainThemes < ActiveRecord::Migration[6.0]
  def change
    create_table :model_plain_themes do |t|
      # Relations
      t.references :user

      # Attributes
      t.integer :theme_number
      t.text :value, limit: 700000

      t.timestamps
    end
  end
end
