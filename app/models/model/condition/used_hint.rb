module Model::Condition # :nodoc:
  #
  # UsedHint 조건 클래스
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
  class UsedHint < Base
    # Enumerize 쓸까?
    # Validations
    validates_inclusion_of :value1,
      in: %w( use gte lte gt lt eq neq ),
      on: :create,
      message: "value1 %s is not correct type"

    validate_presence_of :value2
    # value1 = type
    # use: 그냥 힌트를 사용 or 사용 안했을 때, target이 Hint여야 함.
    # gte: greater than or equal to (a >= X)
    # lte: less than or equal to (a <= X)
    # gt: greater than (a > X)
    # lt: less than (a < X)
    # eq: equal to (a == X)
    # neq: not equal to (a != X)
    # value2 = int or bool
    # use일 경우:
    # X: bool(true or false)
    # 비교일 경우:
    # X: int(number)

    # 조건을 만족하는 지 여부
    # 
    # ==== Return
    # 
    # * Bool
    def cleared?
      case value1.to_sym
      when :use
        # TODO 사용 여부 파악 => boolean
        # ex) target.used_by?(clearer)
        true == value2
      when :gte
        clearer.used_hint_count >= value2.to_i
      when :gt
        clearer.used_hint_count > value2.to_i
      when :lte
        clearer.used_hint_count <= value2.to_i
      when :lt
        clearer.used_hint_count < value2.to_i
      when :eq
        clearer.used_hint_count == value2.to_i
      when :neq
        clearer.used_hint_count != value2.to_i
      end
      # User와 Play 모두 used_hint_count를 쓸 수 있도록 메소드를 만들 것.
    rescue
      super
    end
  end
end
