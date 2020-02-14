class CreateModelRanks < ActiveRecord::Migration[6.0]
  def change
    create_table :model_ranks do |t|
      # Relations
      t.references :rankable, polymorphic: true
      t.references :ranker, polymorphic: true
      t.references :rank_season

      # Attributes
      t.float :value, null: false, default: 0

      t.timestamps

      # Indexes
      t.index [:rank_season_id, :rankable_id, :rankable_type, :ranker_id, :ranker_type], name: "rank_index", unique: true
    end
  end
end
