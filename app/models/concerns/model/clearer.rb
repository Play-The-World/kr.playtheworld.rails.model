module Model
  module Clearer
    extend ActiveSupport::Concern

    included do
      has_many :condition_clears, as: :clearer, dependent: :destroy
      has_many :occurrences, as: :clearer, dependent: :destroy
    end
  end
end