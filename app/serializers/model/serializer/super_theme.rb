module Model::Serializer
  class SuperTheme < Base
    # ID
    set_id :fake_id

    # Attributes
    attributes :title,
    :summary,
    :status,
    :price,
    :data_size,
    :play_time,
    :content,
    :caution
    
    attribute :locations do |x|
      x.locations.map { |a| a.title }.compact
    end
    attribute :categories do |x|
      x.categories.map { |a| a.title }.compact
    end
    attribute :genres do |x|
      x.genres.map { |a| a.title }.compact
    end

    # Links
    link :self, -> (object) { url(object) }
    
    # Relations
    has_many :themes,
      serializer: Model::Serializer::Theme

    def self.url(object)
      "#{BASE_URL}/v1/super_themes/#{object.fake_id}"
    end
  end
end