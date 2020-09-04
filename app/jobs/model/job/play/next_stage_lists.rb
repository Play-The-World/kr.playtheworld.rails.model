module Model::Job::Play
  class NextStageLists < Base
    # sidekiq_options retry: 5
    # retry_on ErrorLoadingSite wait: 5.minutes, queue: :low_priority

    private
      def job(options)
        stage_lists = play.next_stage_lists(options['stage_list_index'].to_i)
        
        return if stage_lists.empty?
        
        play.pusher(
          event: :next_stage_lists,
          params: {
            stage_lists: stage_lists.as_json(:play)
          }
        )
        
        # FOR TEST
        # a = {}
        # a[:event] = :update_inventory
        # a[:params] = { items: items }
        # puts a
      end
      # def debounce?; true end
      # def delay; 1 end
  end
end
