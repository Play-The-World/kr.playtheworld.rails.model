class CreateModelMakerEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :model_maker_entries do |t|
      # Relations
      t.references :maker
      t.references :maker_team

      t.timestamps

      # Indexes
      t.index [:maker_id, :maker_team_id], name: "maker_entry_index", unique: true
    end
  end
end
