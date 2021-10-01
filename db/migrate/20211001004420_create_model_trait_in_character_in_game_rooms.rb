class CreateModelTraitInCharacterInGameRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :model_trait_in_character_in_game_rooms do |t|
      # Relations
      t.references :trait, index: { name: "trait_index" }
      t.references :character_in_game_room, index: { name: "trait_game_room_index" }

      t.timestamps
    end
  end
end
