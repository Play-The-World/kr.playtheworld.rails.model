module Model
  class GameMap < ApplicationRecord
    # Relations
    belongs_to :super_theme, class_name: Model.config.super_theme.class_name
    has_many :map_areas, class_name: Model.config.map_area.class_name, dependent: :destroy
    include Model::Imageable
    include Model::Clueable
  end
end
