class CreateModelEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :model_events do |t|
      # Relations
      t.references :event_group, index: false

      # Attributes
      t.string :value1
      t.string :value2
      t.string :value3
      t.string :value4
      t.string :type

      t.timestamps

      # Indexes
      t.index [:event_group_id, :type, :value1, :value2], name: "event_index"
      t.index :type
    end
  end
end
