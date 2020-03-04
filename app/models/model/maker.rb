module Model
  class Maker < ApplicationRecord
    # Translations
    include Model::Translatable
    translates :name, :content
    
    # Relations
    belongs_to :user
    has_many :maker_entries, dependent: :destroy
    has_many :maker_teams, through: :maker_entries

    # Status
    include Model::HasStatus
    set_status %i(blocked)

    def self.serializer
      Model::Serializer::Maker
    end
  end
end
