class CreateModelBranches < ActiveRecord::Migration[6.0]
  def change
    create_table :model_branches do |t|
      # Relations
      t.references :answer, index: false
      t.references :target_stage_list

      # Attributes
      t.string :type

      t.timestamps

      t.index [:answer, :type]
    end
  end
end
