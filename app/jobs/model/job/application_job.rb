module Model::Job
  class ApplicationJob# < ActiveJob::Base
    include Sidekiq::Worker
  end
end
