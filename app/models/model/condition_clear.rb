module Model
  # 조건을 만족했다는 것을 표현하는 클래스입니다.
  # 해당 클래스의 객체가 생성되면 clearer가 condition을 만족했다고 가정됩니다.
  # 
  # == Relations
  # 
  # ==== belongs_to
  # 
  # * Clearer(polymorphic)
  # * Condition
  class ConditionClear < ApplicationRecord
    # Relations
    belongs_to :clearer, polymorphic: true
    belongs_to :condition
  end
end
