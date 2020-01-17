module Model
  module Condition
    class Base < ApplicationRecord
      # Table Name
      self.table_name = Model.config.condition.table_name

      # Relations
      belongs_to :conditionable, polymorphic: true
    end
  end
end
