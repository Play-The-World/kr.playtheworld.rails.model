module Model::Serializer
  class SuperTheme < Base
    # ID
    set_id :fake_id

    # Attributes
    attributes :title, :summary, :status, :price, :data_size, :play_time, :content, :caution
    attribute :location do |x|
      "#{x.location&.title}"
    end
    attribute :category do |x|
      "#{x.category&.title}"
    end
    attribute :genre do |x|
      "#{x.genre&.title}"
    end
    
    # Relations
    has_many :themes
  end
end