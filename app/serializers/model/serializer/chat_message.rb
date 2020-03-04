module Model::Serializer
  class ChatMessage < Base
    # Attributes
    attributes :content

    # Links
    link :self, -> (object) { url(object) }
    
    # Relations
    belongs_to :chat_room
    # belongs_to :chatter

    def self.url(object)
      "#{BASE_URL}/v1/chat_messages/#{object.id}"
    end
  end
end