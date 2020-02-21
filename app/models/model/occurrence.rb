module Model
  class Occurrence < ApplicationRecord
    # Relations
    belongs_to :clearer, polymorphic: true
    belongs_to :event, class_name: Model.config.event.class_name
  end
end
