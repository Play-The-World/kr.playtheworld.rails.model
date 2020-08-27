module Model::Condition # :nodoc:
  #
  # CurrentLastStageList 조건 클래스
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
  class CurrentLastStageList < Base
    # 조건을 만족하는 지 여부
    # 
    # ==== Return
    # 
    # * Bool
    def cleared?
      play.current_last_stage_list == stage_list
    rescue
      super
    end
    
    private
      def play; clearer end
      def stage_list; conditioner end
  end
end
