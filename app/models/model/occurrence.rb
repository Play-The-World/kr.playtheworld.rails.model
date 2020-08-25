module Model
  class Occurrence < ApplicationRecord
    # Relations
    belongs_to :clearer, polymorphic: true
    belongs_to :event_group
  end
end
