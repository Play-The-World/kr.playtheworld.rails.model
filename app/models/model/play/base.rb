module Model
  module Play
    class Base < ApplicationRecord
      # Table Name
      self.table_name = Model.config.play.table_name
  
      # Relations
      belongs_to :super_play, class_name: Model.config.super_play.class_name, counter_cache: true
    end
  end
end
