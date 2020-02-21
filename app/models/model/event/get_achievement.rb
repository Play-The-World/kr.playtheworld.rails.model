module Model::Event # :nodoc:
  #
  # GetAchievement 이벤트 클래스
  # TODO 이벤트에 대한 설명
  #
  # == Relations
  #
  # ==== belongs_to
  #
  # * Eventable(polymorphic)
  #
  # ==== has_many
  # 
  # * Condition
  class GetAchievement < Base
    # 실행 가능 여부
    # 
    # ==== Return
    # 
    # * Bool
    def triggerable?
      super
      # just use super or code here if you have specific conditions
    end

    # 실행
    def trigger!
      # do something
      # ...
    end

    # 이벤트가 실행되는 대상 (기본값은 Play)
    def clearer
      super
    end
  end
end
