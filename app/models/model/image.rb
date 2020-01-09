module Model
  class Image < ApplicationRecord
    # ActiveStorage
    include Model::HasOneAttached

    # Relations
    belongs_to :imageable, polymorphic: true

    # Enum
    extend Enumerize
    enumerize :image_type, in: %i(default background thumbnail poster), default: :default
    
  end
end
