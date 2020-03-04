module Model::Serializer
  class Post < Base
    # Attributes
    attributes :title, :content, :type, :status

    # Links
    link :self, -> (object) { url(object) }
    
    # Relations
    belongs_to :board
    has_many :comments

    def self.url(object)
      "#{BASE_URL}/v1/posts/#{object.id}"
    end
  end
end