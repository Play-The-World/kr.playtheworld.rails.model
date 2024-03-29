module Model::Condition # :nodoc:
  #
  # BeforeDate 조건 클래스
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
  class BeforeDate < Base
    # 조건을 만족하는 지 여부
    # 
    # ==== Return
    # 
    # * Bool
    def cleared?
      # TODO 조건 명세
      (Time.now.to_datetime <= value1.to_datetime)
    rescue
      super
    end
  end
end
