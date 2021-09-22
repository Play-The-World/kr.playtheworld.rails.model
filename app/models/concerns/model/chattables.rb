module Model
  module Chattables
    extend ActiveSupport::Concern

    included do
      has_many :chat_rooms, as: :chattable, dependent: :destroy

      # Callbacks
      # after_create :create_chat_room

      def chat_room(type = 'default')
        chat_rooms.find { |c| c.type == type }
      end
    end
  end
end