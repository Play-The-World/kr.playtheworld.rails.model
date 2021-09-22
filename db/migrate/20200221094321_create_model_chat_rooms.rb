class CreateModelChatRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :model_chat_rooms do |t|
      # Relations
      t.references :chattable, polymorphic: true, index: false

      # Attributes
      t.string :title
      t.string :status
      t.string :type, null: false, default: 'default'
      t.integer :chat_messages_count, null: false, default: 0

      t.timestamps

      # Indexes
      t.index [:chattable_type, :chattable_id, :status], name: "chat_rooms_index"
    end
  end
end
