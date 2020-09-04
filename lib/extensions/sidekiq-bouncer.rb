module Sidekiq
  class Config
    attr_accessor :redis
  end

  private_constant :Config

  class Bouncer
    BUFFER = 1 # Second.
    DEFAULT_DELAY = 1 # Seconds.
    VERSION = '0.1.1'

    class << self
      def config
        @config ||= Config.new
      end

      def configure(&block)
        yield config
      end
    end

    def initialize(klass, delay = DEFAULT_DELAY)
      @klass = klass
      @delay = delay
    end

    def debounce(params = {})
      options = {}
      params.each do |k, v|
        options[k.to_s] = v
      end
      
      # Refresh the timestamp in redis with debounce delay added.
      self.class.config.redis.set(key(options), now + @delay)

      # Schedule the job with not only debounce delay added, but also BUFFER.
      # BUFFER helps prevent race condition between this line and the one above.
      @klass.perform_at(now + @delay + BUFFER, options)
    end

    def let_in?(options)
      # Only the last job should come after the timestamp.
      timestamp = self.class.config.redis.get(key(options))
      return false if Time.now.to_i < timestamp.to_i

      # But because of BUFFER, there could be mulitple last jobs enqueued within
      # the span of BUFFER. The first one will clear the timestamp, and the rest
      # will skip when they see that the timestamp is gone.
      return false if timestamp.nil?
      self.class.config.redis.del(key(options))

      true
    end

    private
      def key(options)
        "#{@klass}:#{options.to_s}"
      end

      def now
        Time.now.to_i
      end
  end
end