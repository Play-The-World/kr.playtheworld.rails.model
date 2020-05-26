module Model::Condition # :nodoc:
  #
  # NthPlay 조건 클래스
  # TODO 조건에 대한 설명
  #
  # == Relations
  #
  # ==== belongs_to
  #
  # * Conditionable(polymorphic)
  # * Conditioner(polymorphic)
  #
  # ==== has_many
  # 
  # * ConditionClear
  class NthPlay < Base
    # 조건을 만족하는 지 여부
    # 
    # ==== Return
    # 
    # * Bool
    def cleared?
      # (해당 테마를 플레이한 유저 수)번째 플레이가 됨. -> 플레이 생성 직후 사용할 것.
      # TODO: 잘 작동하는 지 테스트 해보기
      Model::User.joins(plays: { theme_data: :theme })
        .where(
          "#{Model.config.theme.table_name}": { id: theme.id },
          "#{Model.config.play.table_name}": { type: Model::Play::Finished }
        ).distinct
        .pluck(:id)
        .index(user.id) == value1.to_i # value1번째 플레이인지 확인
    rescue
      super
    end

    # 조건을 만족했다는 것을 표시하는 함수
    # (ex. ConditionClear를 생성)
    def clear!
      
    end

    private
      def theme; conditioner end
      def user; Model.current.user end
  end
end
