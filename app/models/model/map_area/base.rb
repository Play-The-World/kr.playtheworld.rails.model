module Model
  module MapArea
    class Base < ApplicationRecord
      # Table Name
      self.table_name = Model.config.map_area.table_name

      # Relations
      belongs_to :game_map
      
    end
  end
end