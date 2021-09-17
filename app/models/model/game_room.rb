module Model
  class GameRoom < ApplicationRecord
    # Relations
    belongs_to :team, class_name: Model.config.team.class_name
    belongs_to :super_theme, class_name: Model.config.super_theme.class_name

    # Delegation
    delegate :purpose,
             :users,
             to: :team
  end
end
