module Model::Coordinates
  class Coordinate < ApplicationRecord
    # Relations
    belongs_to :coordinatable, polymorphic: true

    # Enums
    # include Enumerize
    # enumerize :coordinate_type, in: %i(map), default: :map

  end
end
