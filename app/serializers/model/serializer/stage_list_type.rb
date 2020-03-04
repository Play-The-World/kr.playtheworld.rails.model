module Model::Serializer
  class StageListType < Base
    # Attributes
    attributes :component_type, :chance_count, :hints_count

    # Links
    link :self, -> (object) { url(object) }
    
    # Relations
    belongs_to :stage_list
    has_many :answers
    has_many :hints

    def self.url(object)
      "#{BASE_URL}/v1/stage_list_types/#{object.id}"
    end
  end
end