class CreateModelStageLists < ActiveRecord::Migration[6.0]
  def change
    create_table :model_stage_lists do |t|
      # Relations
      t.references :theme_data, index: false

      # Attributes
      t.string :type
      t.integer :stage_list_number, null: false, default: 1

      t.timestamps

      # Indexes
      t.index [:theme_data_id, :stage_list_number]#, unique: true
    end

    reversible do |dir|
      dir.up do
        Model::StageList.create_translation_table!({
          title: :string
        })
      end

      dir.down do
        Model::StageList.drop_translation_table!
      end
    end
  end
end
