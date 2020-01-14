module Model
  class Variable < ApplicationRecord
    # Relations
    belongs_to :object, polymorphic: true

    # Enums
    include Enumerize
    enumerize :variable_type, in: %i(default), default: :default
    
  end
end
