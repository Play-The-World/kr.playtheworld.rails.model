module Model
  class Creation < ApplicationRecord
    # Relations
    belongs_to :creator, polymorphic: true
    belongs_to :product, polymorphic: true
  end
end
