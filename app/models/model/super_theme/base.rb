module Model
  module SuperTheme
    class Base < ApplicationRecord
      # Translations
      include Model::Translatable
      translates :title, :summary, :content, :caution
      
      # Relations
      belongs_to :category, optional: true
      belongs_to :genre, optional: true
      has_many :themes, class_name: "Model::Themes::Theme", dependent: :destroy

      # Status
      include Model::HasStatus
      set_status %i(hidden blocked)

      # Enums
      # extend Enumerize
      # enumerize :themes_type, in: %i(difficulty numbered series role), default: :difficulty

      def category_title
        category.nil? ? "" : category.title
      end
      def genre_title
        genre.nil? ? "" : genre.title
      end
    end
  end
end