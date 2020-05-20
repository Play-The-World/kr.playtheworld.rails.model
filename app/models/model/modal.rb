module Model
  class Modal < ApplicationRecord
    self.inheritance_column = "not_sti"

    # Relations
    belongs_to :modalable, polymorphic: true
    include Model::Interpolatable
    include Model::Linkable

    # Translations
    include Model::Translatable
    translates :title, :content

    # Enums
    extend Enumerize
    enumerize :type, in: %i(default once), default: :default

  end
end
