class CreateModelUsersAchievements < ActiveRecord::Migration[6.0]
  def change
    create_table :model_users_achievements do |t|
      # Relataions
      t.references :model_user
      t.references :model_achievement

      # Attirbutes
      t.integer :count, default: 0

      t.timestamps

      # Indexes
      t.index [:model_user, :model_achievement], unique: true
    end
  end
end
