class CreateModelSuperThemes < ActiveRecord::Migration[6.0]
  def change
    create_table :model_super_themes do |t|
      # Attributes
      t.string :status
      t.string :themes_type
      t.integer :price, null: false, default: 0
      t.integer :play_time, null: false, default: 0
      t.integer :data_size, null: false, default: 0
      
      t.timestamps

      # Indexes
      t.index :status
    end

    reversible do |dir|
      dir.up do
        Model::SuperTheme.create_translation_table!({
          title: :string, content: :text, summary: :text, caution: :text
        })
      end

      dir.down do
        Model::SuperTheme.drop_translation_table!
      end
    end
  end
end
