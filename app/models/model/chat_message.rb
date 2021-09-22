module Model
  class ChatMessage < ApplicationRecord
    self.inheritance_column = "not_sti"

    # Relations
    belongs_to :chatter, polymorphic: true, optional: true
    belongs_to :chat_room, counter_cache: true

    # Status
    include Model::HasStatus
    set_status %i(removed blocked)
    enumerize :type, in: %i(default system bot), default: :default

    def self.serializer
      Model::Serializer::ChatMessage
    end
  end
end
