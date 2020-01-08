module Model
  class Text < ApplicationRecord
    belongs_to :textable, polymorphic: true
    
  end
end
