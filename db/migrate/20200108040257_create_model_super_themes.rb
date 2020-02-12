class CreateModelSuperThemes < ActiveRecord::Migration[6.0]
  def change
    create_table :model_super_themes do |t|
      # Attributes
      t.string :fake_id
      t.string :status
      t.string :type
      t.integer :price, null: false, default: 0
      t.integer :play_time, null: false, default: 0
      t.integer :data_size, null: false, default: 0
      
      t.timestamps

      # Indexes
      t.index :status
      t.index :type
    end

    reversible do |dir|
      dir.up do
        Model.config.super_theme.constant.create_translation_table!({
          title: :string, content: :text, summary: :text, caution: :text
        })
      end

      dir.down do
        Model.config.super_theme.constant.drop_translation_table!
      end
    end
  end
end
