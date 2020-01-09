module Model
  class Text < ApplicationRecord
    # Translations
    include Model::Translatable
    translates :value

    # Relations
    belongs_to :textable, polymorphic: true

    # Enum
    extend Enumerize
    enumerize :text_type, in: %i(default), default: :default
    
  end
end
