module Model
  class ChatRoom < ApplicationRecord
    # Relations
    belongs_to :chattable, polymorphic: true
    has_many :chat_messages, dependent: :destroy
    has_many :chat_room_entries, dependent: :destory

    # Status
    include Model::HasStatus
    set_status %i(removed blocked disabled)
  end
end
