module Model
  class Hint < ApplicationRecord
    self.inheritance_column = "not_sti"

    # Relations
    belongs_to :stage_list_type
    include Model::Imageable

    # Translations
    include Model::Translatable
    translates :content

    # Enums
    extend Enumerize
    enumerize :type, in: %i(default answer), default: :default
  end
end
