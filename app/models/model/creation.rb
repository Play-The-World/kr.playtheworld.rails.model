module Model
  class Creation < ApplicationRecord
    self.inheritance_column = 'not_sti'

    # Relations
    belongs_to :creator, polymorphic: true
    belongs_to :product, polymorphic: true

    # Enums
    extend Enumerize
    enumerize :type, in: %i(producer writer illustrator assistant), default: :producer
  end
end
