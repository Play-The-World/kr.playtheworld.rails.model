class CreateModelEventGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :model_event_groups do |t|
      # Relations
      t.references :eventable, polymorphic: true

      # Attributes
      t.string :title
      t.string :clearer_type
      t.boolean :repeatable, default: false

      t.timestamps
    end
  end
end
