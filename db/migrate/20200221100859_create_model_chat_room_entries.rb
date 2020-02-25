class CreateModelChatRoomEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :model_chat_room_entries do |t|
      # Relations
      t.references :chat_room
      t.references :chatter, polymorphic: true

      # Attributes
      # t.string :type
      t.string :status

      t.timestamps

      # Indexes
      t.index [:chat_room, :status]
      t.index [:chatter_id, :chatter_type, :status]
    end
  end
end
