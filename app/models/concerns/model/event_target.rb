module Model
  module EventTarget
    extend ActiveSupport::Concern

    included do
      has_many :target_events, as: :target, class_name: Model.config.event.class_name, dependent: :nullify
    end
  end
end