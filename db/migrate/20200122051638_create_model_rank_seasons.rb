class CreateModelRankSeasons < ActiveRecord::Migration[6.0]
  def change
    create_table :model_rank_seasons do |t|
      # Attributes
      t.datetime :start_date
      t.datetime :end_date
      t.integer :ranks_count, default: 0

      t.timestamps

      # Index
      t.index [:start_date, :end_date]
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
