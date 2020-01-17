module Model
  module Coordinatable
    extend ActiveSupport::Concern

    included do
      has_one :coordinate, as: :coordinatable, class_name: Model.config.coordinate.class_name, dependent: :destroy
    end
  end
end