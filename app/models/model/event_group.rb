module Model
  class EventGroup < ApplicationRecord
    # Relations
    belongs_to :eventable, polymorphic: true
    has_many :events, class_name: Model.config.event.class_name, dependent: :destroy
    has_many :occurrences, dependent: :destroy
    include Model::Conditionable

    # Enums
    extend Enumerize
    enumerize :clearer_type, in: %i(play user), default: :play

    # 실행 가능 여부
    # 
    # Return
    # 
    # * Bool
    def triggerable?
      # TODO: 조건 테스트 확인하기
      all_cleared? and
      !(!repeatable? and !occurrences.exists?(clearer: clearer))
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

    # 무조건 실행하는 메소드
    def trigger!
      events.each { |e| e.trigger }
    end

    # 이벤트가 실행되는 대상 (기본값은 Play)
    def clearer
      case clearer_type.to_sym
      when :user
        Model.current.user
      else
        Model.current.play
      end
    end

    private
      def repeatable?
        repeatable
      end
  end
end
