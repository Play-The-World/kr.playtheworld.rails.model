module Model
  module SuperTheme
    class Base < ApplicationRecord
      # Table Name
      self.table_name = Model.config.super_theme.table_name

      # Translations
      include Model::Translatable
      translates :title, :summary, :content, :caution
      
      # Relations
      belongs_to :category, optional: true
      belongs_to :genre, optional: true
      belongs_to :location, optional: true
      has_many :themes, class_name: Model.config.theme.class_name, dependent: :destroy, foreign_key: "super_theme_id"
      include Model::Viewable
      include Model::Interpolatable
      include Model::Imageable

      # Status
      include Model::HasStatus
      set_status %i(hidden blocked)

      # Enums
      # extend Enumerize
      # enumerize :themes_type, in: %i(difficulty numbered series role), default: :difficulty

      def theme_class
        self.class.theme_class
      end
      def self.theme_class
        Model.config.theme.constant
      end
      def create_theme(params)
        params[:type] = theme_class.to_s
        puts params
        themes.create!(params)
      end

      def category_title
        category.nil? ? "" : category.title
      end
      def genre_title
        genre.nil? ? "" : genre.title
      end
    end
  end
end