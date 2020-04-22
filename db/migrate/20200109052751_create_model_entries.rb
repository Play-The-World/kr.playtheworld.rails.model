class CreateModelEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :model_entries do |t|
      # Relations
      t.references :user, index: false
      t.references :team

      t.timestamps

      # Indexes
      t.index [:user_id, :team_id]
    end
  end
end
