module Model
  class ApplicationJob# < ActiveJob::Base
    include Sidekiq::Worker
  end
end
