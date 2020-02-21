module Model
  module Expresser
    extend ActiveSupport::Concern

    included do
      has_many: :expressions, as: :expresser, dependent: :destroy

      def liked(expresser:)
        expression_type&.liked_by(expresser: self)
      end
    end
  end
end