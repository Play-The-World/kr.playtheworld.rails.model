module Model
  #
  # 사용자 클래스
  #
  # == Relations
  #
  # ==== has_many
  #
  # * Entry
  # * Team
  # * UsersAchievement
  # * Review
  # * Comment
  # * View
  # * Post
  # * ConditionClear
  #
  # ==== has_one
  #
  # * Maker
  #
  # == Status
  #
  # * +:removed+ - 탈퇴한 사용자
  # * +:blocked+ - 정지된 사용자
  # * +:temp+ - 임시 사용자(비로그인)
  #
  class User < ApplicationRecord
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    # :rememberable
    devise :database_authenticatable, :registerable,
           :recoverable, :validatable, :trackable

    # Relations
    has_many :entries, dependent: :destroy
    has_many :teams, through: :entries
    has_one :maker, dependent: :destroy
    has_many :achievements, class_name: Model::UsersAchievement.to_s
    has_many :plays, dependent: :destroy, class_name: Model.config.play.class_name
    include Model::Reviewer
    include Model::Commenter
    include Model::Viewer
    include Model::Poster
    include Model::Clearer
    include Model::Chatter
    include Model::HasSetting

    # Status
    include Model::HasStatus
    set_status %i(removed blocked unauthorized temp)

    # Tokenable
    include Model::Tokenable

    # Callbacks
    before_create :set_unauthorized

    # 일단 간편하게 쓰려고 만듬
    def play_solo(theme:)
      team = teams.find_or_create_by(type: :solo)
      sp = team.super_plays.create(super_theme_id: theme.super_theme.id)
      Model::Play::Playing.create(super_play: sp, user: self, theme_data: theme.current_theme_data)
    end

    def confirm_email(passcode)
      if passcode == "1234"
        update(status: :default)
      else
        raise
      end
    rescue
      false
    end

    # 기본 serializer 설정
    #
    # ==== Return
    #
    # * Model::Serializer::User
    def self.serializer
      Model::Serializer::User
    end

    private
      def set_unauthorized
        self.status = :unauthorized
      end
  end
end
