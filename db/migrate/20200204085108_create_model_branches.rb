class CreateModelBranches < ActiveRecord::Migration[6.0]
  def change
    create_table :model_branches do |t|
      # Relations
      t.references :model_answers
      t.bigint :target_stage_list_id

      t.timestamps
    end
  end
end
