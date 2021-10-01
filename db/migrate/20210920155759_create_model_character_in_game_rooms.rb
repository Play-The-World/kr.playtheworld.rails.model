class CreateModelCharacterInGameRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :model_character_in_game_rooms do |t|
      # Relations
      t.references :character
      t.references :game_room
      t.references :user
      t.references :play

      # Attributes

      t.timestamps
    end
  end
end
