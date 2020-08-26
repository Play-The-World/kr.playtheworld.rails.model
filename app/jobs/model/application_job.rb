module Model
  class ApplicationJob# < ActiveJob::Base
    include Sidekiq::Worker
    sidekiq_options queue: :default
  end
end
