module Model
  module Modalable
    extend ActiveSupport::Concern

    included do
      has_many :modals, as: :modalable, dependent: :destroy
    end
  end
end