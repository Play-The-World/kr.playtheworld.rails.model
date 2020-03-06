class CreateModelBranches < ActiveRecord::Migration[6.0]
  def change
    create_table :model_branches do |t|
      # Relations
      t.references :answer
      t.references :target_stage_list

      # Attributes
      t.string :type

      t.timestamps
    end
  end
end
