module Model
  class UsersAchievement < ApplicationRecord
    # Relataions
    belongs_to :user
    belongs_to :achievement
    
  end
end
