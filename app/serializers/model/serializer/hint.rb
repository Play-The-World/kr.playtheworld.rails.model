module Model::Serializer
  class Hint < Base
    # Attributes
    attributes :order, :type, :content

    # Links
    link :self, -> (object) { url(object) }
    
    # Relations
    belongs_to :stage_list_type

    def self.url(object)
      "#{BASE_URL}/v1/hints/#{object.id}"
    end
  end
end