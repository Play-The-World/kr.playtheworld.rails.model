module Model::Job
  class ApplicationJob# < ActiveJob::Base
    include Sidekiq::Worker
    sidekiq_options retry: 1

    def perform(options)
      # debounce 옵션으로 debounce를 강제로 사용안하게 할 수도 있음.
      # unless defined?(Sidekiq) and !options['debounce'].nil? and options['debounce'] == false
      #   # Bouncer를 사용하는 경우 + 뒤에 같은 작업이 있는 경우 skip
      #   return if debounce? and !self.class.bouncer.let_in?(options)
      # end

      options.symbolize_keys!
      Model.current.user = Model.config.user.constant.find_by(id: options[:user_id]) if options[:user_id]
      before_job(options)
      job(options)
      after_job(options)
    end

    def run(options = {})
      self.perform(options)
      return

      if debounce?
        self.class.bouncer.debounce(options)
      else
        self.class.perform_async(options)
      end
    end

    class << self
      def bouncer
        @bouncer ||= Sidekiq::Bouncer.new(self, delay)
      end
      # debounce delay (seconds)
      def delay; Sidekiq::Bouncer::DEFAULT_DELAY end
      def run(options = {})
        self.new.run(options)
      end
    end

    private
      # 작업 수행 이전 Callback
      def before_job(options); end
      # 작업 수행
      def job(options); end
      # 작업 수행 이후 Callback
      def after_job(options); end
      # debounce 사용 여부
      def debounce?; false end

      # Helper
      def user; Model.current.user end
  end
end
