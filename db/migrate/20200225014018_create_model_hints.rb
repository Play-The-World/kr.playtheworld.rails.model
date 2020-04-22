class CreateModelHints < ActiveRecord::Migration[6.0]
  def change
    create_table :model_hints do |t|
      # Relations
      t.references :stage_list_type, index: false

      # Attributes
      t.integer :order, null: false, default: 1
      t.string :type

      t.timestamps

      # Indexes
      t.index [:stage_list_type_id, :order], unique: true
    end

    reversible do |dir|
      dir.up do
        Model::Hint.create_translation_table!({
          content: :text
        })
      end

      dir.down do
        Model::Hint.drop_translation_table!
      end
    end
  end
end
