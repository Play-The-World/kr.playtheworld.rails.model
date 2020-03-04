module Model::Serializer
  class StageList < Base
    # Attributes
    attributes :stage_list_number

    # Links
    link :self, -> (object) { url(object) }
    
    # Relations
    belongs_to :theme
    has_many :stages
    has_one :stage_list_type

    def self.url(object)
      "#{BASE_URL}/v1/stage_lists/#{object.id}"
    end
  end
end