module Model
  class Entry < ApplicationRecord
    # Relations
    belongs_to :team
    belongs_to :user, class_name: Model.config.user.class_name
    
  end
end
