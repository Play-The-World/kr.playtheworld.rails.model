module Model
  module GameStat
    class Base < ApplicationRecord
      include Model::StiPreload
      # Table Name
      self.table_name = Model.config.game_stat.table_name

      # Relations
      belongs_to :game_statsable, polymorphic: true
    end
  end
end
