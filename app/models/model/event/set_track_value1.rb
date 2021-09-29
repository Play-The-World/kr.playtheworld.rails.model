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
  class SetTrackValue1 < Base
    # Target: Branch
    # 실행
    def trigger
      puts "SET TRACK VALUE1 triggered"
      return unless target
      play.trakcs.find { |t| t.stage_list == target }&.update(value1: value1.to_i)
    end

    private
      def play
        Model.current.play
      end
  end
end
