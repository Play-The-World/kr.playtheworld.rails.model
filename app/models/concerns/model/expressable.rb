module Model
  module Expressable
    extend ActiveSupport::Concern

    included do
      has_one :expression_type, as: :expressable, dependent: :destroy

      # Callbacks
      after_create :create_expression_type

      # Delegation
      delegate :likes_count,
               :liked_by,
               :liked?,
               to: :expression_type

      # # 좋아요수
      # # 
      # # Return
      # # 
      # # * Integer
      # def likes_count
      #   expression_type.likes_count
      # rescue
      #   0
      # end

      # # 좋아요 표시
      # def liked_by(expresser:)
      #   expression_type.liked_by(expresser: expresser)
      # end
    end
  end
end