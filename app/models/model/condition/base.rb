module Model
  module Condition
    #
    # 기본 조건 클래스
    #
    # == Relations
    #
    # ==== belongs_to
    #
    # * Conditionable(polymorphic)
    #
    # ==== has_many
    # 
    # * ConditionClear
    class Base < ApplicationRecord
      # Table Name
      self.table_name = Model.config.condition.table_name

      # Relations
      belongs_to :conditionable, polymorphic: true
      belongs_to :conditioner, polymorphic: true, optional: true
      has_many :condition_clears, foreign_key: "condition_id"
      include Model::Conditionable

      # Callbacks
      before_create :set_create_clears

      def cleared?
        false
      rescue
        false
      end
      def clear
        if (create_clears and found?) or cleared?
          mark!
          clear!
          # event&.trigger
          conditionable.trigger
        end
      end
      def clear!; end

      def self.serializer
        Model::Serializer::Condition
      end

      # 조건만족시 condition_clear를 자동으로 생성할 지 여부(캐싱 개념)
      def auto_mark; false end

      private
        # 조건을 만족하는 지 확인할 대상 (EventGroup의 clearer)
        def clearer
          conditionable.clearer
        end
        def found?
          condition_clears.exists?(clearer: clearer)
        end
        # 조건 만족했다는 것을 표시(DB에 저장함 -> 속도 개선)
        def mark!
          condition_clears.first_or_create_by(clearer: clearer) if create_clears
        end
        def set_create_clears
          self.create_clears = self.auto_mark if self.create_clears.nil?
        end
    end
  end
end
