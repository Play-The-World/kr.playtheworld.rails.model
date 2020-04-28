module Model
  class Maker < ApplicationRecord
    # Translations
    include Model::Translatable
    translates :name, :content
    
    # Relations
    belongs_to :user, optional: true
    has_many :maker_entries, dependent: :destroy
    has_many :maker_teams, through: :maker_entries
    has_many :creations, as: :creator, dependent: :destroy
    has_many :themes, through: :creation, source: :product, source_type: Model::Theme::Base.to_s
    has_many :super_themes, through: :creation, source: :product, source_type: Model::SuperTheme::Base.to_s

    # Status
    include Model::HasStatus
    set_status %i(blocked)

    def self.serializer
      Model::Serializer::Maker
    end
  end
end
