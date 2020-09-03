module Model::Job::Play
  class UpdateInventory < Base
    # sidekiq_options retry: 5
    # retry_on ErrorLoadingSite wait: 5.minutes, queue: :low_priority

    private
      def run(options)
        # Pusher: Inventory UI Update
        puts "hello!"
      end
      def debounce?; true end
      def delay; 1 end
  end
end
