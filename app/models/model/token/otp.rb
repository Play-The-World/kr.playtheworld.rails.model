module Model::Token
  class Otp < Base
    private
      # 토큰 생성
      def generate_access_token
        self.value = Model.config.otp_digits.times.map { rand(10) }.join
      end

      # 기본 유효시간 설정
      def set_revoked_at
        self.revoked_at = Time.now + Model.config.otp_expiry_time
      end
  end
end