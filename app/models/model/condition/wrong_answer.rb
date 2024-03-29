module Model::Condition # :nodoc:
  #
  # WrongAnswer 조건 클래스
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
  class WrongAnswer < Base
    # Enumerize 쓸까?
    # Validations
    validates_inclusion_of :value1,
      in: %w( answer gte lte gt lt eq neq ),
      on: :create,
      message: "value1 %s is not correct type"

    validate_presence_of :value2
    # value1 = type
    # answer: 특정 Answer를 입력한 경우 (conditioner가 Answer여야 함.)
    # gte: greater than or equal to (a >= X)
    # lte: less than or equal to (a <= X)
    # gt: greater than (a > X)
    # lt: less than (a < X)
    # eq: equal to (a == X)
    # neq: not equal to (a != X)
    # value2 = int or bool
    # answer인 경우:
    # nil
    # 비교일 경우:
    # X: int(number)

    # 조건을 만족하는 지 여부
    # 
    # ==== Return
    # 
    # * Bool
    def cleared?
      case value1.to_sym
      when :answer
        # TODO 사용 여부 파악 => boolean
        return false if conditioner.nil? or !conditioner.is_a?(Model::Answer::Base)
        false
        # conditioner... 어렵네 이건 좀..
        # 일단 사용 안하는 것으로.
      when :gte
        clearer.wrong_answer_count >= value2.to_i
      when :gt
        clearer.wrong_answer_count > value2.to_i
      when :lte
        clearer.wrong_answer_count <= value2.to_i
      when :lt
        clearer.wrong_answer_count < value2.to_i
      when :eq
        clearer.wrong_answer_count == value2.to_i
      when :neq
        clearer.wrong_answer_count != value2.to_i
      end
      # User와 Play 모두 wrong_answer_count를 쓸 수 있도록 메소드를 만들 것.
    rescue
      super
    end
  end
end
