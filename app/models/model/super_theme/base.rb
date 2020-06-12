module Model
  module SuperTheme
    class Base < ApplicationRecord
      # Table Name
      self.table_name = Model.config.super_theme.table_name

      # Translations
      include Model::Translatable
      translates :title, :summary, :content, :caution
      
      # Relations
      include Model::Classifiable
      # belongs_to :category, optional: true
      # belongs_to :genre, optional: true
      # belongs_to :location, optional: true
      has_many :themes, class_name: Model.config.theme.class_name, dependent: :destroy, foreign_key: "super_theme_id"
      include Model::Viewable
      include Model::Interpolatable
      include Model::Imageable
      include Model::Topicable
      has_one :creation, as: :product, dependent: :destroy
      has_one :maker, through: :creation, source: :creator, source_type: Model::Maker.to_s
      has_one :maker_team, through: :creation, source: :creator, source_type: Model::MakerTeam.to_s
      include Model::HasAchievement
      has_many :super_plays, class_name: Model.config.super_play.class_name, dependent: :destroy, foreign_key: "super_theme_id"

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
        themes.create!(params.merge({
          type: theme_class
        }))
      end

      # 기본 serializer 설정
      #
      # ==== Return
      #
      # * Model::Serializer::SuperTheme
      def self.serializer
        Model::Serializer::SuperTheme
      end
    end
  end
end