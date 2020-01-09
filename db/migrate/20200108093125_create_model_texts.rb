class CreateModelTexts < ActiveRecord::Migration[6.0]
  def change
    create_table :model_texts do |t|
      # Relations
      t.references :textable, polymorphic: true

      # Attributes
      t.string :text_type

      t.timestamps

      # Indexes
      t.index :text_type
    end
    
    reversible do |dir|
      dir.up do
        Model::Text.create_translation_table!({
          value: :text
        })
      end

      dir.down do
        Model::Text.drop_translation_table!
      end
    end
  end
end
