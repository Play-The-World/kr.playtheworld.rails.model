class CreateModelEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :model_events do |t|
      # Relations
      t.references :event_group, index: false
      t.references :target, polymorphic: true, index: false

      # Attributes
      t.string :value1
      t.string :value2
      t.string :value3
      t.string :value4
      t.string :type

      t.timestamps

      # Indexes
      # t.index :type
      t.index [:event_group_id, :type], name: "event_index"
      t.index [:target_type, :target_id, :type], name: "event_index2"
    end
  end
end
