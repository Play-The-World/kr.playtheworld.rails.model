class CreateModelChatMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :model_chat_messages do |t|
      # Relations
      t.references :chat_room
      t.references :chatter, polymorphic: true

      # Attributes
      t.string :status
      t.string :type
      t.string :name
      t.text :content

      t.timestamps
    end
  end
end
