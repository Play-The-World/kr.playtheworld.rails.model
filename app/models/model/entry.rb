module Model
  class Entry < ApplicationRecord
    # Relations
    # belongs_to :team, class_name: Model.config.team.class_name
    belongs_to :entryable, polymorphic: true
    belongs_to :user, class_name: Model.config.user.class_name    
  end
end
