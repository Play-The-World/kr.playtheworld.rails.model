module Model
  class Entry < ApplicationRecord
    # Relations
    belongs_to :team
    belongs_to :user
    
  end
end
