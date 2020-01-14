module Model
  class Rank < ApplicationRecord
    # Relations
    belongs_to :rankable, polymorphic: true
    belongs_to :ranker, polymorphic: true

    # Constants
    MAX_VALUE = 1000000

    # Scope
    default_scope order(value: :desc)

    def computed_value
      (value * MAX_VALUE).to_i
    end
  end
end
