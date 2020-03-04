module Model
  class ChatMessage < ApplicationRecord
    # Relations
    belongs_to :chatter, polymorphic: true
    belongs_to :chat_room, counter_cache: true

    # Status
    include Model::HasStatus
    set_status %i(removed blocked)

    def self.serializer
      Model::Serializer::ChatMessage
    end
  end
end
