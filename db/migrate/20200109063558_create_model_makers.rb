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
    end

    reversible do |dir|
      dir.up do
        Model::Maker.create_translation_table!({
          name: :string, content: :text
        })
      end

      dir.down do
        Model::Maker.drop_translation_table!
      end
    end
  end
end