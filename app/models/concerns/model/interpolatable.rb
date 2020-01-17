module Model
  module Interpolatable
    extend ActiveSupport::Concern

    included do
      has_many :interpolations, as: :interpolatable, class_name: Model.config.interpolation.class_name, dependent: :destroy
    end
  end
end