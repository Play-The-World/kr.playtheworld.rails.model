module Model::User
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
  class Base < Model::ApplicationRecord
    # Table Name
    self.table_name = Model.config.user.table_name

    # Rolify
    rolify role_cname: Model.config.role.class_name, role_join_table_name: Model.config.role.table_name

    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    # :rememberable
    devise :database_authenticatable, :registerable,
           :recoverable, :validatable, :trackable

    # Relations
    has_many :entries, dependent: :destroy, foreign_key: "user_id"
    has_many :teams, through: :entries, class_name: Model.config.team.class_name, foreign_key: "user_id"
    has_one :maker, dependent: :nullify, foreign_key: "user_id"
    has_many :achievements, class_name: Model::UsersAchievement.to_s, foreign_key: "user_id"
    has_many :plays, dependent: :destroy, class_name: Model.config.play.class_name, foreign_key: "user_id"
    include Model::Reviewer
    include Model::Commenter
    include Model::Viewer
    include Model::Poster
    include Model::Clearer
    include Model::Chatter
    include Model::HasSetting
    include Model::Statsable
    # FOR TEST
    has_many :plain_themes, dependent: :destroy, foreign_key: "user_id"

    # Status
    include Model::HasStatus
    set_status %i(removed blocked unauthorized temp)

    # Tokenable
    include Model::Tokenable

    # Callbacks
    before_create :set_unauthorized

    # 일단 간편하게 쓰려고 만듬
    def play_solo(theme:)
      solo_team.start_play({ theme: theme })
    end

    def confirm_email(passcode)
      if passcode == "1234"
        # update!(status: :default)
        true
      else
        raise
      end
    rescue
      false
    end

    def notify(title:, content:)
      # Pusher...
    end

    def channel_name
      "private-user#{id}"
    end

    # 기본 serializer 설정
    #
    # ==== Return
    #
    # * Model::Serializer::User
    def self.serializer
      Model::Serializer::User
    end

    def unauthorized?
      self.status == "unauthorized"
    end

    private
      def solo_team
        teams.first_or_create(type: Model::Team::Solo)
      end

      def set_unauthorized
        self.status = :unauthorized if ["default", nil].include?(self.status)
      end
  end
end
