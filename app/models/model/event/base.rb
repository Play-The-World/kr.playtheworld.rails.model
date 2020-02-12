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

      # 실행 가능 여부 => Bool
      def triggerable?; all_cleared? end
      # 실행 => Bool
      def trigger
        trigger! if triggerable? # trigger if triggerable
        triggerable? # returns Boolean
      end
      # 무조건 실행하는 메소드(하위 클래스에서 재선언)
      def trigger!
        # Do something special
      end
    end
  end
end
