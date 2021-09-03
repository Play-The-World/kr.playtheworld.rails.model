module Model
  class Music < ApplicationRecord
    self.inheritance_column = "not_sti"

    # Relations
    # include Model::Audioable
    belongs_to :musicable, polymorphic: true
    belongs_to :audio
    # TODO 이거 고민
    # belongs_to :start_stage_list, class_name: Model::StageList.to_s
    # belongs_to :end_stage_list, class_name: Model::StageList.to_s

    # Enums
    extend Enumerize
    enumerize :type, in: %i(default background effect), default: :default
  end
end
