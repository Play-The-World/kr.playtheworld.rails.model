module Model
  class Item < ApplicationRecord
    # Relations
    belongs_to :theme, optional: true
    has_many :item_in_inventories, dependent: :destroy
    has_many :inventory, through: :item_in_inventories
    include Model::Imageable

    # Translations
    include Model::Translatable
    translates :title, :content
  end
end
