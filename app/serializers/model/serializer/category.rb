module Model::Serializer
  class Category < Base
    # Attributes
    attributes :title

    # Links
    link :self, -> (object) { url(object) }
    
    # Relations
    has_many :super_themes

    def self.url(object)
      "#{BASE_URL}/v1/categories/#{object.id}"
    end
  end
end