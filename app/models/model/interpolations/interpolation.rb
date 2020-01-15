module Model
  module Interpolations
    class Interpolation < ApplicationRecord
      # Relations
      belongs_to :interpolatable, polymorphic: true
      has_many :texts, dependent: :destroy

      # Enums
      # include Enumerize
      # TYPES = {
      #   user_name: "%{user_name}"
      #   nth_review: "%{nth_review}"
      # }
      # enumerize :interpolation_type, in: TYPES.map { |k, v| k.to_sym }

      def target
        "%{}"
      end
      def result
        nil
      end
    end
  end
end
