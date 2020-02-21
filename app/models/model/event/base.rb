module Model
  module Event
    class Base < ApplicationRecord
      # Table Name
      self.table_name = Model.config.event.table_name

      # Relations
      belongs_to :eventable, polymorphic: true
      include Model::Conditionable
      has_many :occurrences, dependent: :destroy, foreign_key: "event_id"
      
      # Scopes
      default_scope { includes(:conditions) }

      # 실행 가능 여부
      # 
      # Return
      # 
      # * Bool
      def triggerable?;
        (!repeatable? and occurrences.exists?(clearer: clearer)) and all_cleared?
      end

      # 실행
      # 
      # Return
      # 
      # * Bool
      def trigger
        if triggerable?
          # trigger if triggerable
          trigger!
          # Clearer에 occurrence 생성
          occurrences.create(clearer: clearer) unless repeatable?
        end
        triggerable? # returns Boolean
      end

      # 무조건 실행하는 메소드(하위 클래스에서 재선언)
      def trigger!
        # Do something special
      end

      # 이벤트가 실행되는 대상 (기본값은 Play)
      def clearer
        Model.current.play
      end
    end
  end
end
