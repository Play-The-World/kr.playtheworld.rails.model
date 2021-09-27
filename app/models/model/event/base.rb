module Model
  module Event
    class Base < ApplicationRecord
      include Model::StiPreload
      # Table Name
      self.table_name = Model.config.event.table_name

      # Relations
      belongs_to :event_group
      belongs_to :target, polymorphic: true, optional: true
      
      # Scopes
      # default_scope { includes(:conditions) }

      # Delegation
      delegate :clearer,
                :conditioner,
                to: :event_group

      # 실행
      # 
      # Return
      # 
      # * Bool
      def trigger
        # Do something special
      end

      def self.serializer
        Model::Serializer::Event
      end
    end
  end
end
