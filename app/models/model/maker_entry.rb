module Model
  class MakerEntry < ApplicationRecord
    # Relations
    belongs_to :makers
    belongs_to :maker_teams
    
  end
end
