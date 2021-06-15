class CreateModelStageLists < ActiveRecord::Migration[6.0]
  def change
    create_table :model_stage_lists do |t|
      # Relations
      t.references :theme_data, index: false

      # Attributes
      t.string :type
      t.integer :number, null: false, default: 1
      t.text :game_component
      # t.boolean :alert_success, null: false, default: true
      # t.boolean :alert_fail, null: false, default: true
      # t.integer :chance_count, null: false, default: 0
      # t.integer :hints_count, null: false, default: 0

      t.timestamps

      # Indexes
      t.index [:theme_data_id, :number]#, unique: true
    end

    reversible do |dir|
      dir.up do
        Model.config.stage_list.constant.create_translation_table!({
          title: :string
        })
      end

      dir.down do
        Model.config.stage_list.constant.drop_translation_table!
      end
    end
  end
end
