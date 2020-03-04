module Model::Serializer
  class Genre < Base
    # Attributes
    attributes :title

    # Links
    link :self, -> (object) { url(object) }
    
    # Relations
    has_many :super_themes

    def self.url(object)
      "#{BASE_URL}/v1/genre/#{object.id}"
    end
  end
end