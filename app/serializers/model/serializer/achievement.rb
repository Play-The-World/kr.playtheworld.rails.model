module Model::Serializer
  class Achievement < Base
    # Attributes
    attributes :title, :content, :condition_content, :level, :stackable

    # Links
    link :self, -> (object) { url(object) }
    
    # Relations
    # belongs_to

    def self.url(object)
      "#{BASE_URL}/v1/achievements/#{object.id}"
    end
  end
end