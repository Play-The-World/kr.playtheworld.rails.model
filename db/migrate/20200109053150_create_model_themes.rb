class CreateModelThemes < ActiveRecord::Migration[6.0]
  def change
    create_table :model_themes do |t|
      # Relations
      t.references :model_super_theme

      # Attributes
      t.string :status
      t.string :type
      t.string :render_type
      t.integer :price, null: false, default: 0
      t.integer :play_time, null: false, default: 0
      t.integer :data_size, null: false, default: 0

      t.timestamps

      # Indexes
      t.index :status
      t.index [:model_super_theme_id, :type]
    end

    reversible do |dir|
      dir.up do
        Model::Themes::Theme.create_translation_table!({
          content: :text, caution: :text
        })
      end

      dir.down do
        Model::Themes::Theme.drop_translation_table!
      end
    end
  end
end
