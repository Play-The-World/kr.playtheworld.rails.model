module Model
  class StageListType < ApplicationRecord
    # Relations
    belongs_to :stage_list

    # Component Type
    COMPONENT_TYPE = Model::ComponentType
    serialize :component_type, COMPONENT_TYPE::Base
    alias_attribute :component, :component_type

    def component_types
      COMPONENT_TYPE.constants.select { |k| COMPONENT_TYPE.const_get(k).instance_of? Class } - [:Base]
    end
  end
end
