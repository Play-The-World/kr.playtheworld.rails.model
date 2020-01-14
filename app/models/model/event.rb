module Model
  class Event < ApplicationRecord
    # Relations
    belongs_to :eventable, polymorphic: true
    include Model::Conditionable
    
    # Scope
    default_scope includes(:conditions)

    def triggerable?
      conditions.each { |c| return false unless c.cleared? }
      true
    end

    def trigger
      return false unless triggerable?
      true
    end
  end
end
