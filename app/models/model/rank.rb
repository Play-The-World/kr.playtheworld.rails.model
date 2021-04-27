module Model
  class Rank < ApplicationRecord
    # Relations
    # belongs_to :rankable, polymorphic: true
    belongs_to :record, polymorphic: true
    belongs_to :ranker, polymorphic: true
    # belongs_to :user, class_name: Model.config.user.class_name
    belongs_to :rank_season, counter_cache: true

    # Constants
    MAX_VALUE = 1000000

    # Scopes
    default_scope { order(value: :desc) }

    def computed_value
      (value * MAX_VALUE).to_i
    end

    def self.serializer
      Model::Serializer::Rank
    end
  end
end
