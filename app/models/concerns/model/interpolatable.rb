module Model
  module Interpolatable
    extend ActiveSupport::Concern

    included do
      has_many :interpolations, as: :interpolatable, dependent: :destroy
    end
  end
end