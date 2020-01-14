module Model
  module Conditionable
    extend ActiveSupport::Concern

    included do
      has_many :conditions, as: :conditionable, dependent: :destroy
    end
  end
end