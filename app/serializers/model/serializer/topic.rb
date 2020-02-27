module Model::Serializer
  class Topic < Base
    # ID
    # set_id :nothing

    # Attributes
    attributes :title

    # Links
    link :self, -> (object) { url(object) }
    
    # Relations
    has_many :super_themes, links: {
      self: -> (object) { url(object) },
      related: -> (object) { "#{url(object)}/super_themes" }
    }
    
    def self.url(object)
      "#{BASE_URL}/v1/topics/#{object.id}"
    end
  end
end