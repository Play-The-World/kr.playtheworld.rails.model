module Model
  class Audio < ApplicationRecord
    self.inheritance_column = "not_sti"
    
    # ActiveStorage
    include Model::HasOneAttached

    # Relations
    belongs_to :audioable, polymorphic: true

    # Enums
    extend Enumerize
    enumerize :type, in: %i(default background effect), default: :default
    # enumerize :store_type, in: %i(external), default: :external
  end
end
