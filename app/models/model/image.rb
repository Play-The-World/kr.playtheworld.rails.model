module Model
  class Image < ApplicationRecord
    self.inheritance_column = "not_sti"
    
    # ActiveStorage
    include Model::HasOneAttached

    # Relations
    belongs_to :imageable, polymorphic: true

    # Enum
    extend Enumerize
    enumerize :type,
      in: %i(
        default
        background
        preview
        thumbnail
        poster
        map
        item_in
        item_out
      ),
      default: :default
    enumerize :store_type, in: %i(default external), default: :default

    def self.serializer
      Model::Serializer::Image
    end
  end
end
