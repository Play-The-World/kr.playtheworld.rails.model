module Model
  class Branch < ApplicationRecord
    self.inheritance_column = "not_sti"
    
    # Relations
    # belongs_to :answer, class_name: Model.config.answer.class_name
    has_many :answers_branches, dependent: :destroy
    has_many :answers, through: :answers_branches, class_name: Model.config.answer.class_name
    belongs_to :stage_list_type
    belongs_to :target_stage_list, class_name: Model::StageList.to_s
    include Model::Conditionable
    include Model::EventTarget

    # Enums
    extend Enumerize
    enumerize :type, in: %i(default pass failed), default: :default

    def reachable?; all_cleared? end

    def self.serializer
      Model::Serializer::Branch
    end
  end
end
