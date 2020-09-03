module Model::Job::Play
  class OnStage < Base
    # sidekiq_options retry: 5
    # retry_on ErrorLoadingSite wait: 5.minutes, queue: :low_priority

    def perform(options)
      super

      play.update(
        stage_index: options[:stage_index],
        stage_list_index: options[:stage_list_index]
      )
      play.current_stage.conditions.each(&:clear)
    end
  end
end
