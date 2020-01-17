module Model
  module Eventable
    extend ActiveSupport::Concern

    included do
      has_many :events, as: :eventable, class_name: Model.config.event.class_name, dependent: :destroy
    end
  end
end