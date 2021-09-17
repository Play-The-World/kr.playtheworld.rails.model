class CreateModelGameRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :model_game_rooms do |t|

      t.timestamps
    end
  end
end
