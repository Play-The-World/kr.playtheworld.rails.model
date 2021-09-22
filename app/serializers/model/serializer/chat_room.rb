module Model::Serializer
  class ChatRoom < Base
    view :base do
      fields  :title, :status, :type, :chat_messages_count, :chatable_type, :chattable_id
      
      # Relations
      # association :images, blueprint: Image
    end

    view :show do
      include_view :base

      association :chat_entry, blueprint: ChatRoomEntry, view: :show
    end

    view :making do
      include_view :base
      # association :branches, blueprint: Branch, view: :making
    end
  end
end