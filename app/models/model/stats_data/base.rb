module Model
  module StatsData
    class Base < ApplicationRecord
      include Model::StiPreload
      # Table Name
      self.table_name = Model.config.stats_data.table_name

      # Relations
      belongs_to :statsable, polymorphic: true
    end
  end
end
