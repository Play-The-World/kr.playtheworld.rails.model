module Model
  class Link < ApplicationRecord
    # Relations
    belongs_to :linkable, polymorphic: true
    has_many :link_usages, dependent: :destroy
  end
end
