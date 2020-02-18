class CreateModelItems < ActiveRecord::Migration[6.0]
  def change
    create_table :model_items do |t|
      # Relations
      t.references :theme

      # Attributes
      t.integer :level, default: 0

      t.timestamps
    end

    reversible do |dir|
      dir.up do
        Model.config.item.constant.create_translation_table!({
          title: :string, content: :text
        })
      end

      dir.down do
        Model.config.item.constant.drop_translation_table!
      end
    end
  end
end
