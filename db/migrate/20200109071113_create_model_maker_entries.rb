class CreateModelMakerEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :model_maker_entries do |t|
      # Relations
      t.references :maker, index: false
      t.references :maker_team, index: false

      t.timestamps

      # Indexes
      t.index [:maker_id, :maker_team_id], name: "maker_entry_index"#, unique: true
      t.index [:maker_team_id, :maker_id], name: "maker_entry_index2"#, unique: true
    end
  end
end
