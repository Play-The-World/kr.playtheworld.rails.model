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

    private
      def play; clearer end
      def stage; conditioner end
  end
end
