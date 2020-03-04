module Model::Serializer
  class Item < Base
    # Attributes
    attributes :title, :content, :level

    # Links
    link :self, -> (object) { url(object) }
    
    # Relations
    belongs_to :theme
    has_many :events

    def self.url(object)
      "#{BASE_URL}/v1/items/#{object.id}"
    end
  end
end