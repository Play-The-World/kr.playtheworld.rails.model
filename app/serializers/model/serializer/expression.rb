module Model::Serializer
  class Expression < Base
    # Attributes
    attributes :type

    # Links
    link :self, -> (object) { url(object) }
    
    # Relations
    # belongs_to :expression_type
    # belongs_to :expresser

    def self.url(object)
      "#{BASE_URL}/v1/expressions/#{object.id}"
    end
  end
end