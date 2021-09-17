module Model
  module Clueable
    extend ActiveSupport::Concern

    included do
      has_many :clues, as: :clueable, dependent: :destroy, class_name: Model.config.clue.class_name
    end
  end
end