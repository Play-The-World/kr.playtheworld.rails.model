module Model
  class MakerTeam < ApplicationRecord
    # Translations
    include Model::Translatable
    translates :name, :content
    
    # Relations
    has_many :maker_entries, dependent: :destory
    has_many :makers, through: :maker_entries
    
  end
end
