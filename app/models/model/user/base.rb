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
    include Model::StiPreload
    # Table Name
    self.table_name = Model.config.user.table_name

    # Rolify
    rolify role_cname: Model.config.role.class_name, role_join_table_name: Model.config.role.table_name

    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    # :rememberable
    devise :database_authenticatable, :registerable,
           :recoverable, #:validatable, 
           :trackable

    # Relations
    has_many :entries, dependent: :destroy, foreign_key: "user_id"
    # has_many :teams, through: :entries, class_name: Model.config.team.class_name, foreign_key: "user_id"
    has_many :teams, through: :entries, source: :entryable, source_type: Model.config.team.class_name
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
    include Model::Tokenable

    # Status
    include Model::HasStatus
    set_status %i(blocked)

    # Enums
    enumerize :sign_up_step, in: [:password, :confirmation, :agreement, :nickname, :done], default: :password

    # Callbacks
    after_create :create_solo_team

    # 일단 간편하게 쓰려고 만듬
    def play_solo(theme:)
      solo_team.start_play({ theme: theme })
    end

    def confirm_email(passcode)
      if passcode == "123456"
        case sign_up_step.to_sym
        when :confirmation
          update!(sign_up_step: :nickname)
        end
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
      # self.status == "unauthorized"
      sign_up_step != :done
    end

    def solo_team; teams.find { |a| a.type == Model::Team::Solo.to_s } end

    private
      def create_solo_team
        teams.first_or_create(type: Model::Team::Solo)
      end
  end
end
