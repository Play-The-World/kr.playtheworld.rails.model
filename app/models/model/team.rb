module Model
  class Team < ApplicationRecord
    # Translations
    include Model::Translatable
    translates :name, :content

    # Relations
    has_many :entries, dependent: :destroy
    has_many :users, through: :entries

    # Status
    include Model::HasStatus
    set_status %i(removed blocked)
    
  end
end
