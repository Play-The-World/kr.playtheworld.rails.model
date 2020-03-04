module Model::Serializer
  class ChatRoom < Base
    # Attributes
    attributes :title, :status, :chat_messages_count

    # Links
    link :self, -> (object) { url(object) }
    
    # Relations
    # belongs_to :chattable
    has_many :chat_messages

    def self.url(object)
      "#{BASE_URL}/v1/chat_rooms/#{object.id}"
    end
  end
end