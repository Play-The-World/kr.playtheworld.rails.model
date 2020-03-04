module Model::Serializer
  class MakerTeam < Base
    # Attributes
    attributes :name, :content, :status

    # Links
    link :self, -> (object) { url(object) }
    
    # Relations
    has_many :makers

    def self.url(object)
      "#{BASE_URL}/v1/maker_teams/#{object.id}"
    end
  end
end