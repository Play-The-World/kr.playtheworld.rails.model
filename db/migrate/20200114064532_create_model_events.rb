class CreateModelEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :model_events do |t|
      # Relations
      t.references :eventable, polymorphic: true, index: false

      # Attributes
      t.boolean :repeatable, default: false
      t.string :value1
      t.string :value2
      t.string :value3
      t.string :value4
      t.string :type

      t.timestamps

      # Indexes
      t.index [:eventable_id, :eventable_type, :type, :value1, :value2, :value3, :value4], name: "event_index"
      t.index :type
    end
  end
end
