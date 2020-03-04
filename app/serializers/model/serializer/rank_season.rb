module Model::Serializer
  class RankSeason < Base
    # Attributes
    attributes :title, :content, :ranks_count, :start_date, :end_date

    # Links
    link :self, -> (object) { url(object) }
    
    # Relations
    has_many :ranks

    def self.url(object)
      "#{BASE_URL}/v1/rank_seasons/#{object.id}"
    end
  end
end