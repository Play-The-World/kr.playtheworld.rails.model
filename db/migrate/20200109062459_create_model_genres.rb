class CreateModelGenres < ActiveRecord::Migration[6.0]
  def change
    create_table :model_genres do |t|

      t.timestamps

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
end
