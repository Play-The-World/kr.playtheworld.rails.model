class CreateModelInfoFiles < ActiveRecord::Migration[6.1]
  def change
    create_table :model_info_files do |t|
      # Relation
      t.references :infoable, polymorphic: true # SuperTheme, ThemeData
      t.references :character

      # Attributes
      t.string :type
      t.text :value

      t.timestamps
    end
  end
end
