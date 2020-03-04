module Model::Serializer
  class Setting < Base
    # Attributes
    attributes :title, :topics_count

    # Links
    link :self, -> (object) { url(object) }
    
    # Relations
    # belongs_to :settingable
    has_many :topics

    def self.url(object)
      "#{BASE_URL}/v1/settings/#{object.id}"
    end
  end
end