class CreateModelRanks < ActiveRecord::Migration[6.0]
  def change
    create_table :model_ranks do |t|
      # Relations
      t.references :record, polymorphic: true
      t.references :ranker, polymorphic: true
      t.references :rank_season, index: false

      # Attributes
      t.integer :value, null: false, default: 0

      t.timestamps

      # Indexes
      t.index [:rank_season_id, :value]
      t.index [:rank_season_id, :ranker_type, :ranker_id], name: "rank_index", unique: true
    end
  end
end
