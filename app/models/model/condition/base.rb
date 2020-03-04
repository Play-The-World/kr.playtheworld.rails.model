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
      has_many :condition_clears, foreign_key: "condition_id"

      def cleared?; false end
      def clear
        clear! if cleared?
        event&.trigger
      end
      def clear!; end

      def self.serializer
        Model::Serializer::Condition
      end

      private
        # conditionable이 Event가 맞으면 Event를 반환한다.
        #
        # ==== Return
        #
        # * Event?
        def event
          conditionable if conditionable.is_a?(Model.config.event.constant)
        end
    end
  end
end
