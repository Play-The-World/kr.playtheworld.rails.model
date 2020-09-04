module Model::Event # :nodoc:
  #
  # GetItem 이벤트 클래스
  # TODO 이벤트에 대한 설명
  #
  # == Relations
  #
  # ==== belongs_to
  #
  # * EventGroup
  # * Target(polymorphic)
  #
  class GetItem < Base
    # 실행
    def trigger
      puts "get item"
      # Get Item
      count = value1.to_i
      count = -1 if count <= 0
      Model::ItemInInventory.create(
        inventory: inventory,
        item: item,
        count: count
      )

      # TODO: Add UI update Job here
      Model::Job::Play::UpdateInventory.run({
        play_id: clearer.id
      })
    end

    def clearer
      Model.current.play
    end

    private
      def inventory; clearer.inventory end
      def item; target end
  end
end
