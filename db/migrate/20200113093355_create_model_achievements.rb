class CreateModelAchievements < ActiveRecord::Migration[6.0]
  def change
    create_table :model_achievements do |t|
      # Attributes
      t.string :level
      t.boolean :stackable
      
      t.timestamps

      # Indexes
      t.index :level
    end

    reversible do |dir|
      dir.up do
        Model::Achievement.create_translation_table!({
          title: :string, content: :text, condition_content: :text
        })
      end

      dir.down do
        Model::Achievement.drop_translation_table!
      end
    end
  end
end
