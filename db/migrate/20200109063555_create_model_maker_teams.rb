class CreateModelMakerTeams < ActiveRecord::Migration[6.0]
  def change
    create_table :model_maker_teams do |t|
      # Attributes
      t.string :status

      t.timestamps

      # Indexes
      t.index :status
    end

    reversible do |dir|
      dir.up do
        Model::MakerTeam.create_translation_table!({
          name: :string, content: :text
        })
      end

      dir.down do
        Model::MakerTeam.drop_translation_table!
      end
    end
  end
end
