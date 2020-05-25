module Model
  module Theme
    class Base < ApplicationRecord
      # Table Name
      self.table_name = Model.config.theme.table_name

      # Translations
      include Model::Translatable
      translates :content, :caution, :start_address, :start_position

      # Status
      include Model::HasStatus
      set_status %i(hidden blocked)

      # PlayType
      # enumerize :play_type, in: %i(default random), default: :default

      # Relations
      belongs_to :super_theme, class_name: Model.config.super_theme.class_name
      has_many :theme_data, dependent: :destroy, foreign_key: "theme_id"
      include Model::Viewable
      # TODO SQL query를 사용해서 stages 추가하기
      include Model::Interpolatable
      has_one :creation, as: :product, dependent: :destroy
      has_one :maker, through: :creation, source: :creator, source_type: Model::Maker.to_s
      has_one :maker_team, through: :creation, source: :creator, source_type: Model::MakerTeam.to_s
      include Model::Conditioner
      include Model::HasAchievement

      # Render Type
      RENDER_TYPE = Model::RenderType
      serialize :render_type, RENDER_TYPE::Base

      # Constants
      FAKE_ID_LENGTH = 12

      # Callbacks
      before_validation :set_theme_type
      before_create :generate_fake_id

      # Validations
      validates :theme_type,
        uniqueness: { scope: :super_theme_id, message: "theme_type should be unique to super_theme" }
      validates :fake_id, 
        uniqueness: { message: "fake_id should be unique" }

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
        def generate_fake_id
          begin
            self.fake_id = SecureRandom.hex(FAKE_ID_LENGTH)
          end while self.class.exists?(fake_id: self.fake_id)
        end

      protected
        def set_theme_type; end
    end
  end
end
