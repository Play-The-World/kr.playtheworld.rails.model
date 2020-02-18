module Model
  class Audio < ApplicationRecord
    # ActiveStorage
    include Model::HasOneAttached

    # Relations
    belongs_to :audioable, polymorphic: true

    # Enums
    extend Enumerize
    enumerize :audio_type, in: %i(default background effect), default: :default
    enumerize :store_type, in: %i(default external), default: :default
  end
end
