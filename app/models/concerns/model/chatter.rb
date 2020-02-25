module Model
  module Chatter
    extend ActiveSupport::Concern

    included do
      has_many :chat_entries, as: :chatter, dependent: :destroy
      has_many :chat_rooms, through: :chat_entries
      has_many :chat_messages, as: :chatter, dependent: :destroy
    end
  end
end