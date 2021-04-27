class CreateModelEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :model_entries do |t|
      # Relations
      t.references :user, index: false
      t.references :team, index: false

      t.timestamps

      # Indexes
      t.index [:user_id, :team_id]
      t.index [:team_id, :user_id]
    end
  end
end
