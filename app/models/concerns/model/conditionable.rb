module Model
  module Conditionable
    extend ActiveSupport::Concern

    included do
      has_many :conditions, as: :conditionable, class_name: Model.config.condition.class_name, dependent: :destroy

      def all_cleared?
        conditions.each { |c| return false unless c.cleared? }
        true
      end
    end
  end
end