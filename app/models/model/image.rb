module Model
  class Image < ApplicationRecord
    include Model::HasOneAttached
    belongs_to :imageable, polymorphic: true

  end
end
