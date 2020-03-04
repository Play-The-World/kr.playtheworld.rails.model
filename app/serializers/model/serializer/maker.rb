module Model::Serializer
  class Maker < Base
    # Attributes
    attributes :name, :content, :status

    # Links
    link :self, -> (object) { url(object) }
    
    # Relations
    belongs_to :user
    has_many :maker_teams

    def self.url(object)
      "#{BASE_URL}/v1/makers/#{object.id}"
    end
  end
end