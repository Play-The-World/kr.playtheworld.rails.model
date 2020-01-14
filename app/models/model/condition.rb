module Model
  class Condition < ApplicationRecord
    # Relations
    belongs_to :event
  end
end
