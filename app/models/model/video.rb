module Model
  class Video < ApplicationRecord
    include Model::HasOneAttached
    belongs_to :videoable, polymorphic: true
    
  end
end
