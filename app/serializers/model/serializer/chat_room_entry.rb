module Model::Serializer
  class ChatRoomEntry < Base
    view :base do
      fields  :status, :chat_room_id, :chatter_id, :chatter_type
      
      # Relations
      # association :images, blueprint: Image
    end

    view :show do
      include_view :base

      # association :chat_entry, blueprint: Chatter, view: :show
      field :chatter do |a|
        a.chatter&.as_json(:base)
      end
    end

    view :making do
      include_view :base
      # association :branches, blueprint: Branch, view: :making
    end
  end
end