module Model::Condition # :nodoc:
  #
  # Or 조건 클래스
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
  class Or < Base
    # 조건을 만족하는 지 여부
    # 
    # ==== Return
    # 
    # * Bool
    def cleared?
      conditions.each do |c|
        return true if c.cleared?
      end
      false
    rescue
      super
    end

    def auto_mark; true end
  end
end
