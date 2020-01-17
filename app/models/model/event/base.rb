module Model
  module Event
    class Base < ApplicationRecord
      # Table Name
      self.table_name = Model.config.event.table_name

      # Relations
      belongs_to :eventable, polymorphic: true
      include Model::Conditionable
      
      # Scopes
      default_scope { includes(:conditions) }

      def triggerable?
        conditions.each { |c| return false unless c.cleared? }
        true
      end

      def trigger
        return false unless triggerable?
        true
      end
    end
  end
end
