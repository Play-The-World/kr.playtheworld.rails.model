module Model
  class TestJob < ApplicationJob
    queue_as :default
    # sidekiq_options retry: 5
    # retry_on ErrorLoadingSite wait: 5.minutes, queue: :low_priority

    def perform(*args)
      # Do something later
      puts "Test Job!"
    end
  end
end
