module Model::Job::Play
  class UpdateInventory < Base
    # sidekiq_options retry: 5
    # retry_on ErrorLoadingSite wait: 5.minutes, queue: :low_priority

    private
      def job(options)
        # Pusher: Inventory UI Update
        items = play.inventory.items.as_json(:play)
        play.pusher(
          event: :update_inventory,
          params: {
            items: items
          }
        )
        
        # FOR TEST
        # a = {}
        # a[:event] = :update_inventory
        # a[:params] = { items: items }
        # puts a
      end
      def debounce?; true end
      def delay; 1 end
  end
end
