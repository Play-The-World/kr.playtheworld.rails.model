class CreateModelCharacterInThemes < ActiveRecord::Migration[6.1]
  def change
    create_table :model_character_in_themes do |t|
      # Relations
      t.references :theme
      t.references :character

      # Attributes
      t.boolean :criminal, default: false

      t.timestamps
    end
  end
end
