module Model::Serializer
  class Theme < Base
    # ID
    set_id :fake_id

    # Attributes
    attributes :difficulty,
      :status,
      :type,
      :theme_type,
      :price,
      :play_time,
      :data_size,
      :super_plays_count
    
    # Relations
    belongs_to :super_theme,
      serializer: Model::Serializer::SuperTheme
    # has_many :s
  end
end