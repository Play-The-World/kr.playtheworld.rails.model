class CreateModelClueInCharacters < ActiveRecord::Migration[6.1]
  def change
    create_table :model_clue_in_characters do |t|
      # Relations
      t.references :clue
      t.references :character

      # Attributes
      t.text :content

      t.timestamps
    end
  end
end
