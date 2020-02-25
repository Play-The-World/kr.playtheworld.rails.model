module Model
  class StageListType < ApplicationRecord
    # Relations
    belongs_to :stage_list
    has_many :answers, class_name: Model.config.answer.class_name, dependent: :destroy
    has_many :hints, dependent: :destroy
    include Model::Coordinatable
    include Model::Imageable

    # Component Type
    COMPONENT_TYPE = Model::ComponentType
    serialize :component_type, COMPONENT_TYPE::Base
    alias_attribute :component, :component_type

    def self.component_type(of:)
      "#{COMPONENT_TYPE.to_s}::#{of}".constantize rescue nil
    end
    
    def self.component_types
      COMPONENT_TYPE.constants.select { |k| COMPONENT_TYPE.const_get(k).instance_of? Class } - [:Base]
    end
  end
end
