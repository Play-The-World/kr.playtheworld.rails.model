module Model::Event # :nodoc:
  #
  # GoNext 이벤트 클래스
  # TODO 이벤트에 대한 설명
  #
  # == Relations
  #
  # ==== belongs_to
  #
  # * EventGroup
  # * Target(polymorphic)
  #
  class SetPlayValue1 < Base
    # Target: Branch
    # 실행
    def trigger
      play.update(value1: value1)
    end

    private
      def play
        Model.current.play
      end
  end
end
