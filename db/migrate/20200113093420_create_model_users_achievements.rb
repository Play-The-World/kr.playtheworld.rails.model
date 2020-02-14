class CreateModelUsersAchievements < ActiveRecord::Migration[6.0]
  def change
    create_table :model_users_achievements do |t|
      # Relataions
      t.references :user
      t.references :achievement

      # Attirbutes
      t.integer :count, default: 0

      t.timestamps

      # Indexes
      t.index [:user_id, :achievement_id], name: "users_achievement_index", unique: true
    end
  end
end
