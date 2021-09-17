class CreateModelCharacters < ActiveRecord::Migration[6.1]
  def change
    create_table :model_characters do |t|
      # Relations
      t.references :super_theme

      # Attributes
      t.string :type
      t.boolean :default, default: true

      t.string :title
      t.string :first_name
      t.string :last_name

      t.integer :age
      t.string :gender

      t.text :statement
      t.text :content

      t.boolean :criminal, default: false

      t.timestamps
    end
  end
end
