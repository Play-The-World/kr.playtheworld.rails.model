module Model
  class GameMap < ApplicationRecord
    # Relations
    belongs_to :super_theme, class_name: Model.config.super_theme.class_name
    has_many :map_areas, class_name: Model.config.map_area.class_name, dependent: :destroy
    include Model::Imageable
    include Model::Clueable

    def search_fail_chance(type = 'normal')
      case type
      when 'deep'
        10
      else
        30
      end
    end
    def search_cost(type = 'normal')
      case type
      when 'deep'
        10
      else
        5
      end
    end
  end
end
