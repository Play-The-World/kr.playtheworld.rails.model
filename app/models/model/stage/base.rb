module Model
  module Stage
    class Base < ApplicationRecord
      # Translations
      include Model::Translatable
      translates :title, :content

      # Relations
      belongs_to :stage_list
      include Model::Imageable
      include Model::Videoable
      include Model::Audioable
      include Model::Textable
      include Model::Interpolatable

      # Enums
      # include Enumerize
      # enumerize :stage_type, in: %i(script quiz end)

      # Scopes
      default_scope { order(order: :asc) }

    end
  end
end