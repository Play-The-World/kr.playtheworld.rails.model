module Model::Serializer
  class Comment < Base
    # Attributes
    attributes :title, :content, :type, :status

    # Links
    link :self, -> (object) { url(object) }
    
    # Relations
    # belongs_to :commentatble
    # belongs_to :commenter
    belongs_to :post

    def self.url(object)
      "#{BASE_URL}/v1/comments/#{object.id}"
    end
  end
end