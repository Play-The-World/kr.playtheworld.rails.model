module Model
  class Image < ApplicationRecord
    self.inheritance_column = "not_sti"
    
    # ActiveStorage
    include Model::HasOneAttached

    # Relations
    belongs_to :imageable, polymorphic: true

    # Enum
    extend Enumerize
    enumerize :type, in: %i(default preview profile background thumbnail poster map item_in item_out), default: :default
    enumerize :store_type, in: %i(default external), default: :default
  end
end
