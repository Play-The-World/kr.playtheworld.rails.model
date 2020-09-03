module Model::Job
  class ApplicationJob# < ActiveJob::Base
    sidekiq_options retry: 1
    include Sidekiq::Worker

    def perform(options)
      # Bouncer를 사용하는 경우 + 이미 작업이 있는 경우 skip
      return if debounce? and !self.class.bouncer.let_in?(options)

      before_run(options)
      run(options)
      after_run(options)
    end

    class << self
      def bouncer
        @bouncer ||= Sidekiq::Bouncer.new(self)
      end
    end

    private
      # 작업 수행 이전 Callback
      def before_run(options); end
      # 작업 수행
      def run(options); end
      # 작업 수행 이후 Callback
      def after_run(options); end
      # debounce 사용 여부
      def debounce?; false end
      # debounce delay (seconds)
      def delay; Sidekiq::Bouuncer::DEFAULT_DELAY end
  end
end
