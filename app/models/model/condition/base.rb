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

      def cleared?
        found?
      rescue
        false
      end
      def clear
        if cleared?
          clear!
          # event&.trigger
          conditionable.trigger
        end
      end
      def clear!; end

      def self.serializer
        Model::Serializer::Condition
      end

      private
        # 조건을 만족하는 지 확인할 대상
        # 기본 값: 현재 플레이
        def clearer
          Model.current.play
        end
        def found?
          condition_clears.exists?(clearer: clearer)
        end
        # 조건 만족했다는 것을 표시(DB에 저장함 -> 속도 개선)
        def mark!
          condition_clears.first_or_create_by(clearer: clearer)
        end
    end
  end
end
