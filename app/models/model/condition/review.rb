module Model::Condition # :nodoc:
  #
  # Reviewed_theme 조건 클래스
  # TODO 조건에 대한 설명
  #
  # == Relations
  #
  # ==== belongs_to
  #
  # * Conditionable(polymorphic)
  #
  # ==== has_many
  # 
  # * ConditionClear
  class Review < Base
    # 조건을 만족하는 지 여부
    # 
    # ==== Return
    # 
    # * Bool
    def cleared?
      nth = value1.to_i
      # 몇 번째 후기인지 체크해야 한다면? (1부터 시작)
      if nth > 0
        # TODO 맞게 동작하는 지 테스트 필요
        conditioner.reviews
          .limit(1)
          .offset(nth - 1)
          .take
          .reviewer == reviewer
      else
        # 후기가 있는 지, 없는 지만 판단.
        conditioner.reviews.exists?(reviewer: reviewer)
      end
    rescue
      super
    end

    # 조건을 만족했다는 것을 표시하는 함수
    # (ex. ConditionClear를 생성)
    def clear!
      
    end

    private
      def reviewer
        Model.current.user
      end
  end
end
