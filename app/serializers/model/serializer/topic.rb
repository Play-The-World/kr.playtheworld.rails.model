module Model::Serializer
  class Topic < Base
    # ID
    # set_id :nothing

    # Attributes
    attributes :title

    # attribute :super_themes do |x|
    #   x.super_themes.map do |s|
    #     {
    #       title: s.title,
    #     }
    #   end
    # end

    # Links
    link :self, -> (object) { url(object) }
    
    # Relations
    has_many :super_themes, links: {
      self: -> (object) { url(object) },
      related: -> (object) { "#{url(object)}/super_themes" }
    }, serializer: ::Model::Serializer::SuperTheme

    has_many :posts, links: {
      self: -> (object) { url(object) },
      related: -> (object) { "#{url(object)}/posts" }
    }, serializer: ::Model::Serializer::Post
    
    def self.url(object)
      "#{BASE_URL}/v1/topics/#{object.id}"
    end
  end
end