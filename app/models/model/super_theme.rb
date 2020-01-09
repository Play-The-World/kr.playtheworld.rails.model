module Model
  class SuperTheme < ApplicationRecord
    # Translations
    include Model::Translatable
    translates :title, :summary, :content, :caution
    
    # Relations
    belongs_to :category, optional: true
    belongs_to :genre, optional: true

    # Status
    include Model::HasStatus
    set_status %i(hidden blocked)

    # Enums
    extend Enumerize
    enumerize :themes_type, in: %i(difficulty numbered series role), default: :difficulty

    def category_title
      category.nil? ? "" : category.title
    end
    def genre_title
      genre.nil? ? "" : genre.title
    end
  end
end
