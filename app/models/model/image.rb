module Model
  class Image < ApplicationRecord
    # ActiveStorage
    include Model::HasOneAttached

    # Relations
    belongs_to :imageable, polymorphic: true

    # Enum
    extend Enumerize
    enumerize :image_type, in: %i(default background thumbnail poster map item_in item_out), default: :default
    enumerize :store_type, in: %i(default external), default: :default
  end
end
