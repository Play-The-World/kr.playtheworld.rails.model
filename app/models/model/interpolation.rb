module Model
  class Interpolation < ApplicationRecord
    # Relations
    belongs_to :interpolatable, polymorphic: true

    # Enums
    include Enumerize
    TYPES = {
      user_name: "%{user_name}"
      nth_review: "%{nth_review}"
    }
    enumerize :interpolation_type, in: TYPES.map { |k, v| k.to_sym }
  end
end
