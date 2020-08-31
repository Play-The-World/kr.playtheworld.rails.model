module Model::Condition # :nodoc:
  #
  # Ending 조건 클래스
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
  class Ending < Base
    # 해당 엔딩으로 플레이 종료시
    # conditioner == StageList

    # 조건을 만족하는 지 여부
    # 
    # ==== Return
    # 
    # * Bool
    def cleared?
      if clearer.is_a?(Model.config.play.constant)
        # Play
        ended?(play: clearer)
      elsif clearer.is_a?(Model.config.user.constant)
        # TODO: 1 Query로 바꾸기
        clearer.plays.where(type: Model::Play::Finished).each do |play|
          return true if ended?(play: play)
        end
        false
      end
    rescue
      super
    end

    private
      def ended?(play:)
        play.stage_lists.find_by(type: :end) == ending_stage_list
      end
      def ending_stage_list
        conditioner
      end
  end
end
