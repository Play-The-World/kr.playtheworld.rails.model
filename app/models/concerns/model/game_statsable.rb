module Model
  module GameStatsable
    extend ActiveSupport::Concern

    included do
      has_many :game_stats, as: :game_statsable, class_name: Model.config.game_stat.class_name, dependent: :destroy
    end
  end
end