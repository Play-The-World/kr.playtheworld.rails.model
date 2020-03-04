module Model
  class Branch < ApplicationRecord
    # Relations
    belongs_to :stage_list_type
    belongs_to :target_stage_list, class_name: Model::StageList.to_s, primary_key: "target_stage_list_id"
    include Model::Conditionable

    def reachable?; all_cleared? end

    def self.serializer
      Model::Serializer::Branch
    end
  end
end
