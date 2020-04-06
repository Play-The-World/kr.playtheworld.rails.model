module Model::Serializer
  class SuperPlay < Base
    # Attributes
    attributes :status, :type, :plays_count

    # Links
    link :self, -> (object) { url(object) }
    
    # Relations
    belongs_to :super_theme
    belongs_to :team
    has_many :plays

    def self.url(object)
      "#{BASE_URL}/v1/super_plays/#{object.id}"
    end
  end
end