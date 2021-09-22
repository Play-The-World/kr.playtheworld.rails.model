module Model
  class GameRoom < ApplicationRecord
    self.inheritance_column = "not_sti"
    
    # Relations
    belongs_to :team, class_name: Model.config.team.class_name, optional: true
    belongs_to :super_theme, class_name: Model.config.super_theme.class_name
    # belongs_to :theme, class_name: Model.config.theme.class_name
    belongs_to :theme_data
    include Model::Chattables
    include Model::Entryable
    has_many :character_in_game_rooms, dependent: :destroy

    # Enums
    include Model::HasStatus
    set_status %i(blocked started)
    enumerize :type, in: %i(default private team), default: :default

    # Delegation
    delegate :purpose,
             :users,
             to: :team
  end
end
