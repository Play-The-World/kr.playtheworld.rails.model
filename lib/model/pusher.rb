module Model
  module Pusher
    def self.trigger(*args)
      return if Model.config.disable_pusher or Model.config.pusher.nil?
      Model.config.pusher.trigger(*args)
    end

    module ChannelName
      def self.global
        "global"
      end
      def self.private_global
        "private-#{global}"
      end
      def self.of(object)
        return object.channel_name if defined? object.channel_name

        if object.class === Class
          names = object.name.split("::")
        else
          names = object.class.name.split("::")
        end

        channel_name = names.size > 2 ? names[-2] : names[-1]
        channel_name.underscore
      end
    end
  end
end