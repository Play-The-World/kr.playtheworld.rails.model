module Model
  class Variable < ApplicationRecord
    # Relations
    belongs_to :object, polymorphic: true

    # Enums
    include Enumerize
    enumerize :variable_type, in: %i(default), default: :default
    
    def self.serializer
      Model::Serializer::Variable
    end
  end
end
