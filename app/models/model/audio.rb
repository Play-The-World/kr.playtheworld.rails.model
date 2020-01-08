module Model
  class Audio < ApplicationRecord
    include Model::HasOneAttached
    belongs_to :audioable, polymorphic: true

  end
end
