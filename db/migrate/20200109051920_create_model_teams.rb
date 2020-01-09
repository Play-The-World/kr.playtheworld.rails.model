class CreateModelTeams < ActiveRecord::Migration[6.0]
  def change
    create_table :model_teams do |t|
      # Attributes
      t.string :status
      
      t.timestamps

      # Indexes
      t.index :status
    end

    reversible do |dir|
      dir.up do
        Model::Team.create_translation_table!({
          name: :string, content: :text
        })
      end

      dir.down do
        Model::Team.drop_translation_table!
      end
    end
  end
end
