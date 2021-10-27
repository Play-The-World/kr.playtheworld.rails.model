module Model
  module Theme
    class Base < ApplicationRecord
      # include Model::StiPreload
      # Table Name
      self.table_name = Model.config.theme.table_name

      # Translations
      include Model::Translatable
      translates :content, :caution, :caution_bold, :start_address, :start_position, :additional_text

      # Status
      include Model::HasStatus
      set_status %i(hidden blocked private closed)

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
      # include Model::Rankable
      has_many :ranks, through: :theme_data
      include Model::Reviewable
      # has_many :character_in_themes, dependent: :destroy, foreign_key: 'theme_id'
      # has_many :clue_in_themes, dependent: :destroy, foreign_key: 'theme_id'
      # has_many :game_rooms, dependent: :destroy, foreign_key: "theme_id"

      # Render Type
      RENDER_TYPE = Model::RenderType
      serialize :render_type, RENDER_TYPE::Base

      # Constants
      FAKE_ID_LENGTH = 10

      # Callbacks
      before_validation :set_theme_type
      before_create :set_fake_id
      after_create :create_current_theme_data

      # Validations
      # TODO: 나중에 넣기
      # validates :theme_type,
      #   uniqueness: { scope: :super_theme_id, message: "theme_type should be unique to super_theme" }
      validates :fake_id, 
        uniqueness: { message: "fake_id should be unique" }

      # Delegation
      delegate :title,
               :online?,
               :genres,
               :locations,
               :categories,
               to: :super_theme
      delegate :current_play_by,
               :finished_play_by,
               :stages,
               :stage_lists,
               :characters,
               :clues,
               to: :current_theme_data

      def current_theme_data
        # theme_data.find_by(version: current_version)
        theme_data.find { |a| a.version == current_version }
      end

      def top_ranks(by = 1)
        ranks
          .order(value: :desc)
          .limit(by)
      end

      def difficulty_s
        self.class.difficulty_s(self.difficulty)
      end

      def end_stages
        stage_lists.select { |a| a.type == Model::StageList::End.to_s }
      end

      def preview_images
        imgs = selected_images(:preview)
        if imgs.empty?
          imgs = stages.first(5).map { |s| s.selected_image(:background) }
        end
        # imgs.compact.map do |i|
        #   i.type = :preview
        # end
        imgs.compact
      end

      def play_time_s(time = self.play_time)
        self.class.play_time_s(time)
      end

      def header_types
        [
          {
            title: '1위 메추리',
            content: '챌린지'
          },
          {
            title: "총 #{achievements.size}개",
            content: '업적'
          },
          {
            title: "총 #{end_stages.size}개",
            content: '엔딩'
          }
        ]
      end

      def detail
        [
          {
            title: '카테고리',
            content: online? ? '온라인' : '오프라인',
          },
          {
            title: '장르',
            content: genres.map do |g|
              g.title
            end.join(', ')
          }
        ]
      end

      def poster_image_url
        img = images.find { |i| i.type === 'poster' }
        img ||= super_theme.poster_image_url
        img&.url
      end

      class << self
        def render_types
          RENDER_TYPE.constants.select { |k| RENDER_TYPE.const_get(k).instance_of? Class } - [:Base]
        end

        # Repository
        def repo
          Model::Repository::Theme.new
        end

        def play_time_s(play_time)
          h = play_time / (60 * 60)
          m = play_time / 60 % 60
          # s = play_time % (60 * 60)
          str = ""
          str += "#{h}시간 " if h != 0
          str += "#{m}분 " if m != 0
          # str += "#{s}초" if s != 0
          str = "0분" if str == ""
          str
        end

        def difficulty_s(diff)
          case diff
          when 0
            "easy"
            "쉬움"
          when 5
            "normal"
            "보통"
          when 10
            "hard"
            "어려움"
          else
            "unknown"
            "알 수 없음"
          end
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
