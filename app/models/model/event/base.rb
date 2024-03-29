module Model
  module Event
    class Base < ApplicationRecord
      # Table Name
      self.table_name = Model.config.event.table_name

      # Relations
      belongs_to :event_group
      belongs_to :target, polymorphic: true, optional: true
      
      # Scopes
      # default_scope { includes(:conditions) }

      # 실행
      # 
      # Return
      # 
      # * Bool
      def trigger
        # Do something special
      end

      # 이벤트가 실행되는 대상 (기본값은 Play)
      def clearer
        event_group.clearer
      end

      def conditioner
        event_group.conditions.take.conditioner
      rescue
        nil
      end

      def self.serializer
        Model::Serializer::Event
      end
    end
  end
end
