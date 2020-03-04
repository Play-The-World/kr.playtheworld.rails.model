module Model::Serializer
  class Location < Base
    # Attributes
    attributes :title

    # Links
    link :self, -> (object) { url(object) }
    
    # Relations
    has_many :super_themes

    def self.url(object)
      "#{BASE_URL}/v1/locations/#{object.id}"
    end
  end
end