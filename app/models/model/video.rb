module Model
  class Video < ApplicationRecord
    self.inheritance_column = "not_sti"

    # ActiveStorage
    include Model::HasOneAttached

    # Relations
    belongs_to :videoable, polymorphic: true

    # Enum
    extend Enumerize
    enumerize :type, in: %i(default background), default: :default
    # enumerize :store_type, in: %i(external), default: :external
  end
end
