class CreateModelChatRoomEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :model_chat_room_entries do |t|
      # Relations
      t.references :chat_room
      t.references :chatter

      # Attributes
      t.string :type
      t.string :status

      t.timestamps

      # Indexes
      t.index :status
    end
  end
end
