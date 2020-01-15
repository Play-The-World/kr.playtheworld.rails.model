class CreateModelConditions < ActiveRecord::Migration[6.0]
  def change
    create_table :model_conditions do |t|
      # Relations
      t.references :conditionable, polymorphic: true, index: { name: "condition_index" }

      # Attributes
      t.string :type

      t.timestamps

      # Indexes
      t.index [:conditionable_id, :conditionable_type, :type], name: "condition_type_index"
      t.index :type
    end
  end
end
