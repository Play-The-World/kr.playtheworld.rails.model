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
  class GoNext < Base
    # Target: Branch
    # 실행
    def trigger
      if target.is_a(Model::Branch)
        play.go_to(target)
      else
        play.go_next!
      end
    end

    private
      def play
        Model.current.play
      end
  end
end
