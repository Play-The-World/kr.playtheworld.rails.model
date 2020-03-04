module Model::Serializer
  class Board < Base
    # Attributes
    attributes :title, :content, :type, :status, :posts_count

    # Links
    link :self, -> (object) { url(object) }
    
    # Relations
    # belongs_to :boardable

    def self.url(object)
      "#{BASE_URL}/v1/board/#{object.id}"
    end
  end
end