class CreateModelThemes < ActiveRecord::Migration[6.0]
  def change
    create_table :model_themes do |t|
      # Relations
      t.references :super_theme

      # Attributes
      t.string :fake_id
      t.string :status
      t.string :type
      t.string :theme_type
      t.string :render_type
      t.integer :price, null: false, default: 0
      t.integer :play_time, null: false, default: 0
      t.integer :data_size, null: false, default: 0
      t.integer :super_plays_count, null: false, default: 0

      t.timestamps

      # Indexes
      t.index :status
      t.index [:super_theme_id, :type]
    end

    reversible do |dir|
      dir.up do
        Model.config.theme.constant.create_translation_table!({
          content: :text, caution: :text
        })
      end

      dir.down do
        Model.config.theme.constant.drop_translation_table!
      end
    end
  end
end
