class CreateModelThemes < ActiveRecord::Migration[6.0]
  def change
    create_table :model_themes do |t|
      # Relations
      t.references :model_super_theme

      # Attributes
      t.string :status
      t.string :render_type
      t.integer :price, null: false, default: 0
      t.integer :play_time, null: false, default: 0
      t.integer :data_size, null: false, default: 0

      t.timestamps

      # Indexes
      t.index :status
    end

    reversible do |dir|
      dir.up do
        Model::Theme.create_translation_table!({
          content: :text, caution: :text
        })
      end

      dir.down do
        Model::Theme.drop_translation_table!
      end
    end
  end
end
