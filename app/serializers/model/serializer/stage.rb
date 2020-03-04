module Model::Serializer
  class Stage < Base
    # Attributes
    attributes :content, :type, :stage_number, :order

    # Links
    link :self, -> (object) { url(object) }
    
    # Relations
    belongs_to :stage_list

    def self.url(object)
      "#{BASE_URL}/v1/stages/#{object.id}"
    end
  end
end