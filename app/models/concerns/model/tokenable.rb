module Model
  module Tokenable
    extend ActiveSupport::Concern

    included do
      has_many :tokens, as: :tokenable, dependent: :destroy

      def token(token_type = :default)
        tokens.where(status: :default, token_type: token_type).take
      end

      def regenerate_token!
        token.revoke! unless token.nil?
        tokens.create(token_type: token.nil? ? :default : token.token_type)
      end
    end
  end
end