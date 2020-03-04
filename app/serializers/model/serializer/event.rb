module Model::Serializer
  class Event < Base
    # Attributes
    attributes :value1, :value2, :value3, :value4, :type, :repeatable

    # Links
    link :self, -> (object) { url(object) }
    
    # Relations
    # belongs_to :eventable

    def self.url(object)
      "#{BASE_URL}/v1/events/#{object.id}"
    end
  end
end