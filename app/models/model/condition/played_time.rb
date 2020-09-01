module Model::Condition # :nodoc:
  #
  # PlayedTime 조건 클래스
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
  class PlayedTime < Base
    # 조건을 만족하는 지 여부
    # 
    # ==== Return
    # 
    # * Bool
    def cleared?
      if clearer.is_a?(Model.config.user.constant)
        # TODO
        clearer.played_time
      elsif clearer.is_a?(Model.config.play.constant)
        # clearer.played_time...
      else
        false
      end
    rescue
      super
    end

    # def auto_mark; true end

    # 조건을 만족했다는 것을 표시하는 함수
    # (ex. ConditionClear를 생성)
    def clear!
      
    end
  end
end
