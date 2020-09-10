module Model::Job::Play
  class Base < ::Model::Job::ApplicationJob
    # sidekiq_options retry: 5
    # retry_on ErrorLoadingSite wait: 5.minutes, queue: :low_priority

    private
      def before_job(options)
        puts options
        Model.current.play = Model::Play::Base.find(options[:play_id])
        puts "play=#{Model.current.play}"
      end
      def play
        Model.current.play
      end
  end
end
