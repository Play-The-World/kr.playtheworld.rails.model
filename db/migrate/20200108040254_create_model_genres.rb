class CreateModelGenres < ActiveRecord::Migration[6.0]
  def change
    create_table :model_genres do |t|
      # Attributes
      t.string :type
      
      t.timestamps

      # Indexes
      t.index :type, unique: true
    end

    reversible do |dir|
      dir.up do
        Model::Genre.create_translation_table!({
          title: :string
        })
      end

      dir.down do
        Model::Genre.drop_translation_table!
      end
    end
  end
end
