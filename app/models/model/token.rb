module Model
  class Token < ApplicationRecord
    # Relations
    belongs_to :tokenable, polymorphic: true

    # Status
    include Model::HasStatus
    set_status %i(revoked)

    # Enums
    extend Enumerize
    enumerize :token_type, in: %i(default unique)

    # Callbacks
    before_create :generate_access_token, :set_revoked_at

    # Validation
    def is_valid? # -> Bool
      !is_revoked?
    end
    def is_revoked? # -> Bool
      status == revoked or (revoked_at and revoked_at <= Time.now)
    end
    def revoke! # -> Bool
      update(revoked_at: Time.now, status: :revoked)
    end

    private
    # 토큰 생성
    def generate_access_token
      case self.token_type.to_sym
      when :default # n numbers by default
        # Set n here
        n = 6
        self.value = n.times.map { rand(10) }.join

      when :unique  # token has to be unique
        begin
          self.value = SecureRandom.hex
        end while self.class.exists?(value: value)

      end
    end

    # 기본 유효시간 설정
    def set_revoked_at
      case self.token_type.to_sym
      when :default
        self.revoked_at = Time.now + Configs::Token::TIME
        
      when :unique
        return
        
      end
    end
  end
end
