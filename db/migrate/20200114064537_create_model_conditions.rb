class CreateModelConditions < ActiveRecord::Migration[6.0]
  def change
    create_table :model_conditions do |t|
      # Relations
      t.references :conditionable, polymorphic: true, index: false
      t.references :conditioner, polymorphic: true, index: false

      # Attributes
      t.string :value1
      t.string :value2
      t.string :type
      t.boolean :create_clears

      t.timestamps

      # Indexes
      t.index [:conditionable_id, :conditionable_type, :type, :value1], name: "conditions_index"
      t.index [:conditioner_id, :conditioner_type, :type, :value1], name: "conditions_index2"
    end
  end
end
