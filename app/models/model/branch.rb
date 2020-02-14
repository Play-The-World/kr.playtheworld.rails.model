module Model
  class Branch < ApplicationRecord
    # Relations
    belongs_to :stage_list_type
    belongs_to :target_stage_list, class_name: Model::StageList.to_s, foreign_key: "target_stage_list_id"
    include Model::Conditionable

    def reachable?; all_cleared? end
  end
end
