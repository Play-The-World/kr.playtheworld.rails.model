module Model::Condition # :nodoc:
  #
  # Did_stage 조건 클래스
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
  class OnNextStageList < Base
    # 조건을 만족하는 지 여부
    # 
    # ==== Return
    # 
    # * Bool
    def cleared?
    #   play.stage_lists.exists?(conditioner)
    # rescue
    #   super
      true
    end

    private
      def play; clearer end
  end
end
