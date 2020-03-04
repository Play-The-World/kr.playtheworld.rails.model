module Model::Serializer
  class Variable < Base
    # Attributes
    attributes :type, :name, :value

    # Links
    link :self, -> (object) { url(object) }
    
    # Relations
    # belongs_to :object

    def self.url(object)
      "#{BASE_URL}/v1/variables/#{object.id}"
    end
  end
end