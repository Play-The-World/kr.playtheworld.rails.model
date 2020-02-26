module Model::Serializer
  class Theme < Base
    # ID
    set_id :fake_id

    # Attributes
    attributes :start_stage_list_number
    
    # Relations
    has_many :stage_lists
  end
end