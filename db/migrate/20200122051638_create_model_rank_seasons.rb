class CreateModelRankSeasons < ActiveRecord::Migration[6.0]
  def change
    create_table :model_rank_seasons do |t|
      # Relations
      t.references :rankable, polymorphic: true, index: false

      # Attributes
      t.datetime :start_date
      t.datetime :end_date
      t.integer :ranks_count, default: 0

      t.timestamps

      # Index
      t.index [:rankable_type, :rankable_id, :start_date], name: "rank_season_index"
      # t.index [:start_date, :end_date]
    end

    reversible do |dir|
      dir.up do
        Model::RankSeason.create_translation_table!({
          title: :string, content: :text
        })
      end

      dir.down do
        Model::RankSeason.drop_translation_table!
      end
    end
  end
end
