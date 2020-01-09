class CreateModelMakers < ActiveRecord::Migration[6.0]
  def change
    create_table :model_makers do |t|
      # Relations
      t.references :model_user

      # Attributes
      t.string :status

      t.timestamps

      # Indexes
      t.index :status

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
end
