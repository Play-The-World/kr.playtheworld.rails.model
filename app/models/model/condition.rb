module Model
  class Condition < ApplicationRecord
    # Relations
    belongs_to :event, class_name: "Model::Events::Event" 
  end
end
