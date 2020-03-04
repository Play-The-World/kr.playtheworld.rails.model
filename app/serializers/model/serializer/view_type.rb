module Model::Serializer
  class ViewType < Base
    # Attributes
    attributes :type, :views_count

    # Links
    link :self, -> (object) { url(object) }
    
    # Relations
    # belongs_to :viewable
    # has_many :views

    def self.url(object)
      "#{BASE_URL}/v1/view_types/#{object.id}"
    end
  end
end