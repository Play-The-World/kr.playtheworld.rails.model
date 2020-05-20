module Model
  class Link < ApplicationRecord
    # Relations
    belongs_to :linkable, polymorphic: true
  end
end
