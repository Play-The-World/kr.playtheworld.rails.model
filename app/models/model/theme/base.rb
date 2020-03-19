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
      has_many :stage_lists, dependent: :destroy, foreign_key: "theme_id"
      include Model::Viewable
      has_many :super_plays, dependent: :destroy, counter_cache: true, foreign_key: "theme_id"
      # TODO SQL query를 사용해서 stages 추가하기
      include Model::Interpolatable
      include Model::Eventable
      has_one :creation, as: :product, dependent: :destroy
      has_one :maker, through: :creation, source: :creator, source_type: Model::Maker.to_s
      has_one :maker_team, through: :creation, source: :creator, source_type: Model::MakerTeam.to_s

      # Render Type
      RENDER_TYPE = Model::RenderType
      serialize :render_type, RENDER_TYPE::Base

      def render_types
        RENDER_TYPE.constants.select { |k| RENDER_TYPE.const_get(k).instance_of? Class } - [:Base]
      end

      # Callbacks
      before_validation :set_theme_type
      before_create :generate_fake_id

      # Validations
      validates :theme_type,
        uniqueness: { scope: :super_theme_id, message: "should be unique to super_theme" }

      # Repository
      def self.repo
        Model::Repository::Theme.new
      end

      # 기본 serializer 설정
      #
      # ==== Return
      #
      # * Model::Serializer::Theme
      def self.serializer
        Model::Serializer::Theme
      end

      private
        def generate_fake_id
          begin
            self.fake_id = SecureRandom.hex(8)
          end while self.class.exists?(fake_id: self.fake_id)
        end

      protected
        def set_theme_type; end
    end
  end
end
