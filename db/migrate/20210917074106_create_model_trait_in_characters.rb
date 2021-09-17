class CreateModelTraitInCharacters < ActiveRecord::Migration[6.1]
  def change
    create_table :model_trait_in_characters do |t|
      # Relations
      t.references :trait
      t.references :character

      t.timestamps
    end
  end
end
