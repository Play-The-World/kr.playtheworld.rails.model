module Model
  class UsersAchievement < ApplicationRecord
    # Relataions
    belongs_to :user
    belongs_to :achievement
    belongs_to :object
    
  end
end
