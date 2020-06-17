module Model
  class Style < ApplicationRecord
    self.inheritance_column = "not_sti"

    # Relations
    belongs_to :styleable, polymorphic: true

    # Enums
    extend Enumerize
    enumerize :type, in: %i(default background_color font_color), default: :default
  end
end
