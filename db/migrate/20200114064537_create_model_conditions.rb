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
      # t.index :type
      t.index [:conditionable_type, :conditionable_id, :type, :value1], name: "conditions_index"
      t.index [:conditioner_type, :conditioner_id, :type, :value1], name: "conditions_index2"
    end
  end
end
