class CreateModelUsersAchievements < ActiveRecord::Migration[6.0]
  def change
    create_table :model_users_achievements do |t|
      # Relataions
      t.references :user, index: false
      t.references :achievement
      t.references :object, polymorphic: true

      # Attirbutes
      t.integer :count, default: 0

      t.timestamps

      # Indexes
      t.index [:user_id, :achievement_id], name: "users_achievements_index", unique: true
      # t.index [:achievement_id, :user_id], name: "users_achievements_index2"
    end
  end
end
