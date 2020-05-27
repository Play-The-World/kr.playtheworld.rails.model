module Model::Repository
  class Token < Base
    def valid
      entity.where("expired_at < ?", Time.now)
    end

    private
      def entity
        Model::Token::Base
      end
  end
end