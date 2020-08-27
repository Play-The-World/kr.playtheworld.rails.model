module Model::Event # :nodoc:
  #
  # Notification 이벤트 클래스
  # TODO 이벤트에 대한 설명
  #
  # == Relations
  #
  # ==== belongs_to
  #
  # * EventGroup
  # * Target(polymorphic)
  #
  class Notification < Base
    # value1 = title
    # value2 = content

    # 실행
    def trigger
      title = value1
      content = value2

      if target&.is_a?(Model.config.user.constant)
        notify(target, { title: title, content: content })
      elsif target&.is_a?(Model.config.super_play.constant)
        target.plays.each do |play|
          notify(play, { title: title, content: content })
        end
      elsif target&.is_a?(Model.config.play.constant)
        notify(target, { title: title, content: content })
      else
        return
      end
    end

    private
      def notify(target, data)
        target.notify(title: data[:title], content: data[:content])
      end
  end
end
