module Model::Serializer
  class Token < Base
    # Attributes
    attributes :type, :value, :expired_at

    # Links
    link :self, -> (object) { url(object) }
    
    # Relations
    belongs_to :tokenable

    def self.url(object)
      "#{BASE_URL}/v1/tokens/#{object.id}"
    end
  end
end