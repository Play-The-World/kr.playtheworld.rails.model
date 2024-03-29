module Model
  class View < ApplicationRecord
    # Relations
    belongs_to :viewer, polymorphic: true, optional: true
    belongs_to :view_type, counter_cache: true
  end
end
