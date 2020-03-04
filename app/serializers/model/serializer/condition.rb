module Model::Serializer
  class Condition < Base
    # Attributes
    attributes :value1, :value2, :type

    # Links
    link :self, -> (object) { url(object) }
    
    # Relations
    # has_many :conditionable

    def self.url(object)
      "#{BASE_URL}/v1/conditions/#{object.id}"
    end
  end
end