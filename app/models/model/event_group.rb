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
      # 반복 불가하면서 이미 수행된 경우
      !(unrepeatable? and occurrences.exists?(clearer: clearer)) and cleared?
    end

    # 실행
    # 
    # Return
    # 
    # * Bool
    def trigger
      if triggerable?
        # Clearer에 occurrence 생성
        occurrences.where(clearer: clearer).first_or_create if unrepeatable?

        # trigger if triggerable
        trigger!
      end
      triggerable? # returns Boolean
    # TODO: production환경에선 주석 해제
    # rescue
    #   false
    end

    # 무조건 실행하는 메소드
    def trigger!
      puts "EventGroup #{id} Triggerd !" if Rails.env.development?
      events.each { |e| e.trigger }
    end

    # 이벤트가 실행되는 대상 (기본값은 Play)
    def clearer
      case clearer_type.to_sym
      when :user
        Model.current.user
      when :play
        Model.current.play
      else
        Model.current.play
      end
    end

    def cleared?
      conditions.each do |condition|
        return false unless condition.cleared?
      end
      true
    end

    private
      def repeatable?; repeatable end
      def unrepeatable?; !repeatable end
  end
end
