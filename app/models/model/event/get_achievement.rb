module Model::Event # :nodoc:
  #
  # GetAchievement 이벤트 클래스
  # TODO 이벤트에 대한 설명
  #
  # == Relations
  #
  # ==== belongs_to
  #
  # * EventGroup
  #
  class GetAchievement < Base
    # 실행
    def trigger
      Model::UsersAchievement.create(
        achievement: achievement,
        user: user,
        object: object
      )
    end

    private
      def achievement; target end
      def user; clearer end
      def object; conditioner end
  end
end
