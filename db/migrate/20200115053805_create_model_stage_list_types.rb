class CreateModelStageListTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :model_stage_list_types do |t|
      # Relations
      t.references :stage_list

      # Attirbutes
      t.string :component_type
      t.integer :chance_count, null: false, default: 0
      t.integer :hints_count, null: false, default: 0

      t.timestamps
    end
  end
end
