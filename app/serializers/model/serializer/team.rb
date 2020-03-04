module Model::Serializer
  class Team < Base
    # Attributes
    attributes :name, :content, :status, :super_plays_count

    # Links
    link :self, -> (object) { url(object) }
    
    # Relations
    has_many :users

    def self.url(object)
      "#{BASE_URL}/v1/teams/#{object.id}"
    end
  end
end