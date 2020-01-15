class CreateModelEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :model_events do |t|
      # Relations
      t.references :eventable, polymorphic: true

      # Attributes
      t.string :type

      t.timestamps

      # Indexes
      t.index [:eventable_id, :eventable_type, :type], name: "event_index"
      t.index :type
    end
  end
end
