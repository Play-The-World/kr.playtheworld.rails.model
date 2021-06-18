module Model
  class UsersAchievement < ApplicationRecord
    # Relataions
    belongs_to :user, class_name: Model.config.user.class_name
    belongs_to :achievement
    belongs_to :object, polymorphic: true, optional: true
    
  end
end
