class CreateModelRanks < ActiveRecord::Migration[6.0]
  def change
    create_table :model_ranks do |t|
      # Relations
      t.references :rankable, polymorphic: true
      t.references :ranker, polymorphic: true

      # Attributes
      t.float :value, null: false, default: 0

      t.timestamps
    end
  end
end
