module Model::Job
  class Test < ApplicationJob
    sidekiq_options retry: 5
    # retry_on ErrorLoadingSite wait: 5.minutes, queue: :low_priority

    def perform(*args)
      # Do something later
      puts "Test Job!"
      Model::Pusher.trigger('UserChannel1', 'message', { message: "hello" })
    end
  end
end
