class CreateModelChatRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :model_chat_rooms do |t|
      # Relations
      t.references :chattable, polymorphic: true

      # Attributes
      t.string :title

      t.timestamps
    end
  end
end
