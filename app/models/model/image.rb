module Model
  class Image < ApplicationRecord
    self.inheritance_column = "not_sti"
    
    # ActiveStorage
    include Model::HasOneAttached

    # Relations
    belongs_to :imageable, polymorphic: true

    # Enum
    enumerize :type,
      in: %i(
        default
        background
        preview
        thumbnail
        poster
        map
        answer
        item_in
        item_out
        open_graph
        relation
        game_map
      ),
      default: :default
    # enumerize :store_type, in: %i(external), default: :external

    def video?
      false
    end

    def self.serializer
      Model::Serializer::Image
    end
  end
end
