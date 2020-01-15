module Model
  class Text < ApplicationRecord
    # Translations
    include Model::Translatable
    translates :value

    # Relations
    belongs_to :textable, polymorphic: true
    belongs_to :interpolation, class_name: "Model::Interpolations::Interpolation", optional: true

    # Enums
    extend Enumerize
    enumerize :text_type, in: %i(default interpolation), default: :default

    # Scopes
    scope :interpolation, -> { where(text_type: :interpolation) }
    
  end
end
