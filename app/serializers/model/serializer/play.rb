module Model::Serializer
  class Play < Base
    # Attributes
    attributes :stage_list_index, 
      :stage_index, 
      :status, 
      :type, 
      :finished_at
    
    # Relations
    belongs_to :user,
      serializer: Model::Serializer::User
    belongs_to :super_play,
      serializer: Model::Serializer::SuperPlay
    # belongs_to :theme_data
    has_many :stage_lists,
      serializer: Model::Serializer::StageList
  end
end