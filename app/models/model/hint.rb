module Model
  class Hint < ApplicationRecord
    self.inheritance_column = "not_sti"

    # Relations
    belongs_to :stage_list_type, counter_cache: true
    include Model::Imageable

    # Translations
    include Model::Translatable
    translates :content

    # Enums
    extend Enumerize
    enumerize :type, in: %i(default answer), default: :default

    # Scopes
    default_scope { order(order: :asc) }

    def self.serializer
      Model::Serializer::Hint
    end
  end
end
