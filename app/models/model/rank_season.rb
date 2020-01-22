module Model
  class RankSeason < ApplicationRecord
    # Relations
    has_many :ranks, dependent: :destroy

    # Translations
    include Model::Translatable
    translates :title, :content
  end
end
