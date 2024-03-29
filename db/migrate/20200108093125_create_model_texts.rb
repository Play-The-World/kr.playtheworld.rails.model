class CreateModelTexts < ActiveRecord::Migration[6.0]
  def change
    create_table :model_texts do |t|
      # Relations
      t.references :textable, polymorphic: true, index: false
      t.references :interpolation

      # Attributes
      t.string :type
      t.integer :order, default: 1

      t.timestamps

      # Indexes
      t.index [:textable_id, :textable_type, :type, :order], name: "texts_index", unique: true
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
