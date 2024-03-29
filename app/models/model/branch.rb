module Model
  class Branch < ApplicationRecord
    # Relations
    belongs_to :answer, class_name: Model.config.answer.class_name
    belongs_to :target_stage_list, class_name: Model::StageList.to_s
    include Model::Conditionable
    include Model::EventTarget

    def reachable?; all_cleared? end

    def self.serializer
      Model::Serializer::Branch
    end
  end
end
