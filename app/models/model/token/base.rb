module Model
  module Token
    class Base < ApplicationRecord
      # Table Name
      self.table_name = Model.config.token.table_name

      # Relations
      belongs_to :tokenable, polymorphic: true

      # Validations
      validates :type,
        uniqueness: { message: "type must be set." }

      # Callbacks
      before_create :generate_access_token, :set_revoked_at

      # Methods
      def valid? # -> Bool
        !revoked?
      end
      def expired? # -> Bool
        expired_at and expired_at <= Time.now
      end
      def expire! # -> Bool
        update!(expired_at: Time.now)
      end

      def regenerate!
        self.class.transaction do
          self.expire!
          self.tokenable.tokens.create!
        end
      end

      # Repository
      def self.repo
        Model::Repository::Token.new(self)
      end

      def self.serializer
        Model::Serializer::Token
      end

      protected
        # 토큰 생성
        def generate_access_token; end

        # 기본 유효시간 설정
        def set_revoked_at; end
    end
  end
end
