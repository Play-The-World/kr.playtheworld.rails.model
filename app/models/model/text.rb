module Model
  class Text < ApplicationRecord
    self.inheritance_column = "not_sti"

    # Translations
    include Model::Translatable
    translates :value

    # Relations
    belongs_to :textable, polymorphic: true
    belongs_to :interpolation, class_name: Model.config.interpolation.class_name, optional: true

    # Enums
    extend Enumerize
    enumerize :type, in: %i(
      default
      answer
      interpolation
    ), default: :default

    # Scopes
    scope :interpolation, -> { where(text_type: :interpolation) }
    
  end
end
