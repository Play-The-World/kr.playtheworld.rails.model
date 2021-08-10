class CreateModelAchievements < ActiveRecord::Migration[6.0]
  def change
    create_table :model_achievements do |t|
      # Relations
      t.references :object, polymorphic: true, index: false
      t.references :stackable, index: false

      # Attributes
      t.integer :level, null: false, default: 0
      t.string :type
      
      t.timestamps

      # Indexes
      t.index :type
      t.index [:stackable_id, :type]
      t.index [:object_type, :object_id, :type, :level], name: "achievement_index"
    end

    reversible do |dir|
      dir.up do
        Model::Achievement::Base.create_translation_table!({
          title: :string, content: :text, condition_content: :text
        })
      end

      dir.down do
        Model::Achievement::Base.drop_translation_table!
      end
    end
  end
end
