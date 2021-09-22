class CreateModelClueInThemes < ActiveRecord::Migration[6.1]
  def change
    create_table :model_clue_in_themes do |t|
      # Relations
      # t.references :theme
      t.references :theme_data
      t.references :clue

      # Attributes
      t.boolean :shared, default: false

      t.timestamps
    end
  end
end
