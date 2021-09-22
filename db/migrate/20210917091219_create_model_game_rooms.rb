class CreateModelGameRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :model_game_rooms do |t|
      # Relations
      t.references :super_theme
      # t.references :theme
      t.references :theme_data
      t.references :team
      t.references :super_play

      # Attributes
      t.string :type
      t.string :status
      t.string :title
      t.string :content
      t.string :password
      t.integer :max_user_count, default: 1

      t.timestamps
    end
  end
end
