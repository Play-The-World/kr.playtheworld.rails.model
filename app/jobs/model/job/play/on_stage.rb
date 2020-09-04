module Model::Job::Play
  class OnStage < Base
    # sidekiq_options retry: 5
    # retry_on ErrorLoadingSite wait: 5.minutes, queue: :low_priority

    private
      def run(options)
        @play.update(
          stage_index: options['stage_index'],
          stage_list_index: options['stage_list_index']
        )
        @play.current_stage.conditions.each(&:clear)
      rescue
        nil
      end
      # def debounce?; true end
      # def delay; 0.5 end
  end
end
