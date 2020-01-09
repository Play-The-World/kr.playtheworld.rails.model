module Model
  class Stage < ApplicationRecord
    # Translations
    include Model::Translatable
    translates :title, :content

    # Relations
    belongs_to :stage_list

  end
end
