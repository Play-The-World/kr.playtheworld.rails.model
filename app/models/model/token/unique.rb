module Model::Token
  class Unique < Base
    # Validations
    validates :value,
      uniqueness: { scope: :type, message: "access_token should be unique." }

    private
      # 토큰 생성
      def generate_access_token
        begin
          self.value = SecureRandom.hex
        end while self.class.exists?(value: self.value)
      end
  end
end