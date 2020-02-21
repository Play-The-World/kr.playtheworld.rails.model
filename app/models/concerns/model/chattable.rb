module Model
  module Chattable
    extend ActiveSupport::Concern

    included do
      has_one :chat_room, as: :chattable, dependent: :destroy

      # Callbacks
      # after_create :create_chat_room

      # 좋아요수
      # 
      # Return
      # 
      # * Integer
      def likes_count
        expression_type.likes_count
      rescue
        0
      end

      # 좋아요 표시
      def liked_by(expresser:)
        expression_type.liked_by(expresser: expresser)
      end
    end
  end
end