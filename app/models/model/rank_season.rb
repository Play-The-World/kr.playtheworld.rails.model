module Model
  class RankSeason < ApplicationRecord
    # Relations
    has_many :ranks, dependent: :destroy

    # Translations
    include Model::Translatable
    translates :title, :content

    # TODO 기본 랭크 시즌
    def self.current
      self.find_or_create_by(title: "시즌 1")
    end
  end
end
