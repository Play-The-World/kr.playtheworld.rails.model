class CreateModelOccurrences < ActiveRecord::Migration[6.0]
  def change
    create_table :model_occurrences do |t|
      # Relations
      t.references :clearer, polymorphic: true
      t.references :event

      t.timestamps
    end
  end
end
