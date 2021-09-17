module Model
  module GameStat
    class Base < ApplicationRecord
      # Table Name
      self.table_name = Model.config.game_stat.table_name

      # Relations
      belongs_to :game_statsable, polymorphic: true
    end
  end
end
