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
  class Played < Base
    # 조건을 만족하는 지 여부
    # 
    # ==== Return
    # 
    # * Bool
    def cleared?
      # Model.current.user.plays.finished.exists?(theme: theme)
      # TODO 위랑 아래 쿼리 비교해보기.
      if conditioner.is_a?(Model::ThemeData)
        Model::Play::Finished.joins(:theme_data, :user)
          .where("#{Model.config.user.constant.table_name}": { id: user.id }, "#{Model::ThemeData.table_name}": { id: conditioner.id })
          .exists?
      elsif conditioner.is_a?(Model::Theme::Base)
        Model::Play::Finished.joins({ theme_data: :theme }, :user)
          .where("#{Model.config.user.constant.table_name}": { id: user.id }, "#{Model.config.theme.table_name}": { id: conditioner.id })
          .exists?
      else
        false
      end
    rescue
      super
    end

    def auto_mark; true end

    private
      def user; Model.current.user end
  end
end
