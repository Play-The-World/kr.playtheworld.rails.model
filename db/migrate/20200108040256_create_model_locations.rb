class CreateModelLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :model_locations do |t|
      t.timestamps
    end

    reversible do |dir|
      dir.up do
        Model.config.location.constant.create_translation_table!({
          title: :string
        })
      end

      dir.down do
        Model.config.location.constant.drop_translation_table!
      end
    end
  end
end
