class CreateModelChatRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :model_chat_rooms do |t|
      # Relations
      t.references :chattable, polymorphic: true

      # Attributes
      t.string :title
      t.string :status
      t.integer :chat_messages_count, null: false, default: 0

      t.timestamps

      # Indexes
      t.index :status
    end
  end
end
