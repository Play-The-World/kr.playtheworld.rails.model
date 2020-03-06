module Model::Serializer
  class Theme < Base
    # ID
    set_id :fake_id

    # Attributes
    attributes :start_stage_list_number,
      :difficulty,
      :status,
      :type,
      :theme_type,
      :price,
      :play_time,
      :data_size,
      :super_plays_count
    
    # Relations
    has_many :stage_lists
  end
end