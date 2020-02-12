class CreateModelConditionClears < ActiveRecord::Migration[6.0]
  def change
    create_table :model_condition_clears do |t|
      # Relations
      t.references :clearer, polymorphic: true
      t.references :model_conditions

      t.timestamps
    end
  end
end
