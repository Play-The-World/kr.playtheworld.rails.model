module Model::Serializer
  class Play < Base
    # Attributes
    attributes :stage_list_index, 
      :stage_index, 
      :status, 
      :type, 
      :finished_at, 
      :wrong_answer_count, 
      :used_hint_count, 
      :used_answer_count
    
    # Relations
    belongs_to :user
    belongs_to :super_play
    belongs_to :theme
    has_many :stage_lists
  end
end