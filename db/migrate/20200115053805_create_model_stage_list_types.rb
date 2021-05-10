class CreateModelStageListTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :model_stage_list_types do |t|
      # Relations
      t.references :stage_list

      # Attirbutes
      t.text :game_component
      # t.boolean :alert_success, null: false, default: true
      # t.boolean :alert_fail, null: false, default: true
      # t.integer :chance_count, null: false, default: 0
      # t.integer :hints_count, null: false, default: 0

      t.timestamps
    end
  end
end
