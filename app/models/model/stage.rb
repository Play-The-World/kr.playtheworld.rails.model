module Model
  class Stage < ApplicationRecord
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

    # Scope
    default_scope order(order: :asc)
  end
end
