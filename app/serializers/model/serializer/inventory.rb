module Model::Serializer
  class Inventory < Base
    # Attributes
    attributes :space

    # Links
    link :self, -> (object) { url(object) }
    
    # Relations
    belongs_to :play
    has_many :items

    def self.url(object)
      "#{BASE_URL}/v1/inventories/#{object.id}"
    end
  end
end