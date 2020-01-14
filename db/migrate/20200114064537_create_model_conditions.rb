class CreateModelConditions < ActiveRecord::Migration[6.0]
  def change
    create_table :model_conditions do |t|
      # Relations
      t.references :conditionable, polymorphic: true

      # Attributes
      t.string :condition_type

      t.timestamps

      # Indexes
      t.index [:conditionable, :condition_type]
    end
  end
end
