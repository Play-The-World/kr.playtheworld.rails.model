module Model
  module Ranker
    extend ActiveSupport::Concern

    included do
      has_many :ranks, as: :ranker, dependent: :destroy
    end
  end
end