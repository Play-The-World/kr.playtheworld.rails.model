class CreateModelStageListTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :model_stage_list_types do |t|
      # Relations
      t.references :model_stage_list

      # Attirbutes
      t.string :component_type
      t.integer :chance_count, null: false, default: 0

      t.timestamps

      # Indexes
      t.index :component_type
    end
  end
end