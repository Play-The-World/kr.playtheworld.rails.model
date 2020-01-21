module Model
  module Tokenable
    extend ActiveSupport::Concern

    included do
      has_many :tokens, as: :tokenable, class_name: Model.config.token.class_name, dependent: :destroy

      # TODO
      def token(token_type = Model.config.token.constant)
        tokens.where(status: :default, token_type: token_type).take
      end

      def generate_token(token_type = Model.config.token.constant)
        token_type.create(tokenable: self)
      end

      def regenerate_token!(token_type = Model.config.token.constant)
        token(token_type) ? token(token_type).regenerate! : generate_token(token_type)
      end
    end
  end
end