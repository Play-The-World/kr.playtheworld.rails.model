module Model
  module Conditioner
    extend ActiveSupport::Concern

    included do
      has_many :conditions, as: :conditioner, class_name: Model.config.condition.class_name, dependent: :destroy
    end
  end
end