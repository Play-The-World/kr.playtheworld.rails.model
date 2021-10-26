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
    has_many :providers, dependent: :destroy, foreign_key: "user_id"

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

    def connect_provider(info)
      self.class.find_for_provider(info, self)
    end
    # info = { provider, uid, access_token?, refresh_token?, email }
    def self.connect_provider(info, current_user = nil)
      # raise Error::Standard.new(message, code, status)
      provider = Model::Provider.find_by(type: info[:type] || :oauth2, name: info[:provider], uid: info[:uid])

      if current_user and provider 
        if provider.user != current_user
          raise '이미 연동된 계정입니다.'
        else
          exist = current_user.providers.find { |pr| pr.name == info[:provider] }
          if exist and exist.uid != info[:uid]
            raise '이미 다른 계정에 연동되어있습니다.'
          end
        end
      end

      user = current_user
      user ||= Model::User::Default.find_by(email: info[:email]) if info[:email].present?
      user ||= Model::User::Default.new do |u|
        tmp_password = SecureRandom.hex

        u.email = info[:email]
        u.sign_up_step = :agreement
        u.password = tmp_password
        u.password_confirmation = tmp_password
      end
      if user.nickname.nil? and ![:nickname, :agreement, :done].include?(user.sign_up_step.to_sym)
        user.sign_up_step = :agreement
      end
      user.save

      provider ||= Model::Provider.new
      provider.type = info[:type] || :oauth2
      provider.name = info[:provider]
      provider.uid = info[:uid]
      provider.user = user
      provider.access_token = info[:access_token] if info[:access_token].present?
      provider.refresh_token = info[:refresh_token] if info[:refresh_token].present?
      provider.save

      user
    end

    def solo_team; teams.find { |a| a.type == Model::Team::Solo.to_s } end

    private
      def create_solo_team
        teams.first_or_create(type: Model::Team::Solo)
      end
  end
end
