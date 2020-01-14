class CreateModelEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :model_events do |t|
      # Relations
      t.references :eventable, polymorphic: true

      # Attributes
      t.string :event_type

      t.timestamps

      # Indexes
      t.index [:eventable, :event_type]
    end
  end
end
