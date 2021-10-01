module Model::Job::Play
  class UpdateInventory < Base
    # sidekiq_options retry: 5
    # retry_on ErrorLoadingSite wait: 5.minutes, queue: :low_priority

    private
      def job(options)
        item_in_inventories = play.inventory.item_in_inventories.as_json(:play)
        clue_in_inventories = play.inventory.clue_in_inventories.as_json(:play)

        play.pusher(
          event: :update_inventory,
          params: {
            item_in_inventories: item_in_inventories,
            clue_in_inventories: clue_in_inventories,
          }
        )

        # Pusher: Inventory UI Update
        # items = play.inventory.items.as_json(:play)
        # play.pusher(
        #   event: :update_inventory,
        #   params: {
        #     items: items
        #   }
        # )
      end
      def debounce?; true end
      def delay; 1 end
  end
end
