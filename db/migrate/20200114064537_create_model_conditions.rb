class CreateModelConditions < ActiveRecord::Migration[6.0]
  def change
    create_table :model_conditions do |t|
      # Relations
      t.references :conditionable, polymorphic: true, index: false

      # Attributes
      t.string :value1
      t.string :value2
      t.string :type

      t.timestamps

      # Indexes
      t.index [:conditionable_id, :conditionable_type, :type, :value1, :value2], name: "conditions_index"
    end
  end
end
