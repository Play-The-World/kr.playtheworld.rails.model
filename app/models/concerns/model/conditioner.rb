module Model
  module Conditioner
    extend ActiveSupport::Concern

    included do
      has_many :conditions, as: :conditioner, class_name: Model.config.condition.class_name, dependent: :destroy

      def clear_conditions(type = nil)
        unless type.nil?
          conditions.where(type: type).each do |condition|
            # Type을 지정한 경우 조건만족 로직을 스킵할 수 있도록 조치
            condition.clear([condition])
          end
        else
          conditions.each(&:clear)
        end
      end
    end
  end
end