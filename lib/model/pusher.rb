module Model
  class Pusher
    class << self
      def trigger(*args)
        return if Model.config.disable_pusher or Model.config.pusher.nil?
        Model.config.pusher.trigger(*args)
      end
    end
  end
end