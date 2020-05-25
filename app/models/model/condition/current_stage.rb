module Model::Condition # :nodoc:
  #
  # CurrentStage 조건 클래스
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
  class CurrentStage < Base
    # 조건을 만족하는 지 여부
    # 
    # ==== Return
    # 
    # * Bool
    def cleared?
      play.current_stage == stage
    rescue
      super
    end

    # 조건을 만족했다는 것을 표시하는 함수
    # (ex. ConditionClear를 생성)
    def clear!
      
    end

    private
      def play
        clearer
      end
      def stage
        conditioner
      end
  end
end
