module Model
  module Chattable
    extend ActiveSupport::Concern

    included do
      has_one :chat_room, as: :chattable, dependent: :destroy

      # Callbacks
      # after_create :create_chat_room
    end
  end
end