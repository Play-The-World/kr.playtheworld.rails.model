module Model
  class Video < ApplicationRecord
    # ActiveStorage
    include Model::HasOneAttached

    # Relations
    belongs_to :videoable, polymorphic: true

    # Enum
    extend Enumerize
    enumerize :video_type, in: %i(default background), default: :default
    enumerize :store_type, in: %i(default external), default: :default
  end
end
