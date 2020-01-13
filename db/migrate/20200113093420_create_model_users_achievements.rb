class CreateModelUsersAchievements < ActiveRecord::Migration[6.0]
  def change
    create_table :model_users_achievements do |t|

      t.timestamps
    end
  end
end
