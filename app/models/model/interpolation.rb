module Model
  class Interpolation < ApplicationRecord
    # Relations
    belongs_to :interpolatable, polymorphic: true

    # Enums
    include Enumerize
    TYPES = {
      nth_review: "%{nth_review}"
    }
    enumerize :value_type, in: TYPES.map { |k, v| k.to_sym }
  end
end
