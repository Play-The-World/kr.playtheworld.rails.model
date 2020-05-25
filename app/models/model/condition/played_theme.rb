module Model::Condition # :nodoc:
  #
  # PlayedTheme 조건 클래스
  # TODO 조건에 대한 설명
  #
  # == Relations
  #
  # ==== belongs_to
  #
  # * Conditionable(polymorphic)
  #
  # ==== has_many
  # 
  # * ConditionClear
  class PlayedTheme < Base
    # 조건을 만족하는 지 여부
    # 
    # ==== Return
    # 
    # * Bool
    def cleared?
      # Model.current.user.plays.finished.exists?(theme: theme)
      # TODO 위랑 아래 쿼리 비교해보기.
      Model::Play::Finished.joins(:theme, :user)
        .where("#{Model::User.table_name}": Model.current.user, "#{Model.config.theme.table_name}": theme)
        .exists?
    rescue
      super
    end

    # 조건을 만족했다는 것을 표시하는 함수
    # (ex. ConditionClear를 생성)
    def clear!
      
    end

    private
      def theme
        # Model.config.theme.constant.find_by(id: value1)
        conditioner
      end
  end
end
