module Model
  module SuperTheme
    class Base < ApplicationRecord
      # Table Name
      self.table_name = Model.config.super_theme.table_name

      # Translations
      include Model::Translatable
      translates :title, :summary, :content
      
      # Relations
      include Model::Classifiable
      has_many :themes, class_name: Model.config.theme.class_name, dependent: :destroy, foreign_key: "super_theme_id"
      include Model::Viewable
      include Model::Interpolatable
      include Model::Imageable
      include Model::Topicable
      include Model::Product
      include Model::HasAchievement
      has_many :super_plays, class_name: Model.config.super_play.class_name, dependent: :destroy, foreign_key: "super_theme_id"
      include Model::Modalable

      # Status
      include Model::HasStatus
      set_status %i(committed under_review standby private published closed ended blocked)

      # Enums
      # extend Enumerize
      # enumerize :themes_type, in: %i(difficulty numbered series role), default: :difficulty

      # Callbacks
      before_create :init

      # Constants
      FAKE_ID_LENGTH = 10

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

      private
        def init
          return unless fake_id.nil? or fake_id.empty?
          
          begin
            self.fake_id = SecureRandom.hex(FAKE_ID_LENGTH)
          end while self.class.exists?(fake_id: self.fake_id)

          # self.status = :created
        end
    end
  end
end