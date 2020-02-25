module Model
  class ChatRoomEntry < ApplicationRecord
    # Relations
    belongs_to :chat_room
    belongs_to :chatter, polymorphic: true

    # Status
    include Model::HasStatus
    set_status %i(invited kicked)
  end
end
