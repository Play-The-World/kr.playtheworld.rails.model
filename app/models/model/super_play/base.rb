module Model
  module SuperPlay
    class Base < ApplicationRecord
      include Model::StiPreload
      # Table Name
      self.table_name = Model.config.super_play.table_name

      # Relations
      belongs_to :team, class_name: Model.config.team.class_name
      # belongs_to :theme_data
      belongs_to :super_theme, counter_cache: 'super_plays_count', class_name: Model.config.super_theme.class_name, foreign_key: 'super_theme_id'
      has_many :plays, class_name: Model.config.play.class_name, dependent: :destroy, foreign_key: "super_play_id"
      has_one :game_room, dependent: :destroy

      def channel_name
        # "private-play#{id}"
        "SuperPlayChannel#{id}"
      end

      def go_next!
        plays.each(&:go_next!)
      end

      def set_ready(ready_state = false, push = true)
        plays.each do |pl|
          pl.set_ready(ready_state, false)
        end

        if push
          pusher(event: 'ready', params: {
            plays: plays.map do |pl|
              {
                id: pl.id,
                ready: pl.ready
              }
            end
          })
        end
      end
    end
  end
end
