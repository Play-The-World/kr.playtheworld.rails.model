module Model::Serializer
  class Branch < Base
    # Attributes
    attributes :type

    # Links
    link :self, -> (object) { url(object) }
    
    # Relations
    belongs_to :answer
    has_one :target_stage_list

    def self.url(object)
      "#{BASE_URL}/v1/branches/#{object.id}"
    end
  end
end