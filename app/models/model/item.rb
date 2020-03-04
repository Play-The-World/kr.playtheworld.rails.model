module Model
  class Item < ApplicationRecord
    # Relations
    belongs_to :theme, optional: true
    has_many :item_in_inventories, dependent: :destroy
    has_many :inventory, through: :item_in_inventories
    include Model::Imageable
    include Model::Eventable

    # Translations
    include Model::Translatable
    translates :title, :content

    def self.serializer
      Model::Serializer::Item
    end
  end
end
