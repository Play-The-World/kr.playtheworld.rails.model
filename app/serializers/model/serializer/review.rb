module Model::Serializer
  class Review < Base
    # Attributes
    attributes :title, :content, :type, :status

    # Links
    link :self, -> (object) { url(object) }
    
    # Relations
    # belongs_to :reviewable
    # belongs_to :reviewer
    has_many :comments

    def self.url(object)
      "#{BASE_URL}/v1/reviews/#{object.id}"
    end
  end
end