module Model
  class Inventory < ApplicationRecord
    # Relations
    belongs_to :play, class_name: Model.config.play.class_name
    has_many :item_in_inventories, dependent: :destroy
    has_many :items, through: :item_in_inventories
  end
end
