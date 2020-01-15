class CreateModelMakerEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :model_maker_entries do |t|
      # Relations
      t.references :model_maker
      t.references :model_maker_team

      t.timestamps

      # Indexes
      t.index [:model_maker_id, :model_maker_team_id], name: "maker_entry_index", unique: true
    end
  end
end
