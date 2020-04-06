module Model
  module Coordinate
    class Base < ApplicationRecord
      # Table Name
      self.table_name = Model.config.coordinate.table_name

      # Relations
      belongs_to :coordinatable, polymorphic: true

      # Enums
      # include Enumerize
      # enumerize :coordinate_type, in: %i(map), default: :map

    end
  end
end
