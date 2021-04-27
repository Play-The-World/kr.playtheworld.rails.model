module Model
  module Theme
    class Base < ApplicationRecord
      # Table Name
      self.table_name = Model.config.theme.table_name

      # Translations
      include Model::Translatable
      translates :content, :caution, :caution_bold, :start_address, :start_position, :additional_text

      # Status
      include Model::HasStatus
      set_status %i(hidden blocked)

      # Enums
      enumerize :play_type, in: %i(scenario random), default: :scenario
      enumerize :publish_type, in: %i(default swift), default: :default
      enumerize :price_type, in: %i(simple complex), default: :simple

      # Relations
      belongs_to :super_theme, class_name: Model.config.super_theme.class_name
      has_many :theme_data, dependent: :destroy, foreign_key: "theme_id"
      include Model::Viewable
      include Model::Interpolatable
      include Model::Imageable
      include Model::Product
      include Model::Conditioner
      include Model::HasAchievement
      include Model::Eventable
      include Model::Coordinatable
      include Model::Statsable
      include Model::Rankable

      # Render Type
      RENDER_TYPE = Model::RenderType
      serialize :render_type, RENDER_TYPE::Base

      # Constants
      FAKE_ID_LENGTH = 12

      # Callbacks
      before_validation :set_theme_type
      before_create :set_fake_id
      after_create :create_current_theme_data

      # Validations
      validates :theme_type,
        uniqueness: { scope: :super_theme_id, message: "theme_type should be unique to super_theme" }
      validates :fake_id, 
        uniqueness: { message: "fake_id should be unique" }

      # Delegation
      # delegate :stage_lists,
      #          :stages,
      #          to: :current_theme_data
      delegate :title, to: :super_theme

      def current_theme_data
        # theme_data.find_by(version: current_version)
        theme_data.find { |a| a.version == current_version }
      end

      def difficulty_str
        case self.difficulty
        when 0
          "easy"
        when 5
          "normal"
        when 10
          "hard"
        else
          "unknown"
        end
      end

      class << self
        def render_types
          RENDER_TYPE.constants.select { |k| RENDER_TYPE.const_get(k).instance_of? Class } - [:Base]
        end

        # Repository
        def repo
          Model::Repository::Theme.new
        end

        # 기본 serializer 설정
        #
        # ==== Return
        #
        # * Model::Serializer::Theme
        def serializer
          Model::Serializer::Theme
        end
      end

      private
        def set_fake_id
          return unless fake_id.nil? or fake_id.empty?

          begin
            self.fake_id = SecureRandom.hex(FAKE_ID_LENGTH)
          end while self.class.exists?(fake_id: self.fake_id)
        end

        def create_current_theme_data
          theme_data.find_or_create_by(version: current_version)
        end

      protected
        def set_theme_type; end
    end
  end
end
