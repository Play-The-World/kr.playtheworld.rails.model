module Model::Serializer
  class Answer < Base
    # Attributes
    attributes :type, :value, :ordered, :case_sensitive

    # Links
    link :self, -> (object) { url(object) }
    
    # Relations
    belongs_to :stage_list_type

    def self.url(object)
      "#{BASE_URL}/v1/answers/#{object.id}"
    end
  end
end