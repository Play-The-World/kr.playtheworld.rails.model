module Model
  module Textable
    extend ActiveSupport::Concern

    included do
      has_many :texts, as: :textable, dependent: :destroy
    end
  end
end