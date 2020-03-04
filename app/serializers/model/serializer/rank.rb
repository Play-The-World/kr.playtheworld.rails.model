module Model::Serializer
  class Rank < Base
    # Attributes
    attributes :value

    # Links
    link :self, -> (object) { url(object) }
    
    # Relations
    # belongs_to :rankable
    # belongs_to :ranker
    belongs_to :rank_season

    def self.url(object)
      "#{BASE_URL}/v1/ranks/#{object.id}"
    end
  end
end