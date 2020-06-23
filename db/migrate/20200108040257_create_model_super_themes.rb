class CreateModelSuperThemes < ActiveRecord::Migration[6.0]
  def change
    create_table :model_super_themes do |t|
      # Relations
      # t.references :location
      # t.references :genre
      # t.references :category

      # Attributes
      t.string :fake_id
      t.string :status
      t.string :type
      
      t.timestamps

      # CounterCache
      t.integer :super_plays_count, default: 0, null: false

      # Indexes
      t.index :status
      t.index :type
    end

    reversible do |dir|
      dir.up do
        Model.config.super_theme.constant.create_translation_table!({
          title: :string, content: :text, summary: :text
        })
      end

      dir.down do
        Model.config.super_theme.constant.drop_translation_table!
      end
    end
  end
end
