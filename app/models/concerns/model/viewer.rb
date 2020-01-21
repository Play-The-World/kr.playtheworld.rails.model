module Model
  module Viewer
    extend ActiveSupport::Concern

    included do
      has_many: views, as: :viewer, dependent: :destroy
    end
  end
end