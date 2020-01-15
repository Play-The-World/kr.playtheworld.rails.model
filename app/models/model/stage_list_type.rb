module Model
  class StageListType < ApplicationRecord
    # Relations
    belongs_to :stage_list

    # Enums
    include Enumerize
    TYPES = %i(
      form1
      choice1
    )
    enumerize :component_type, in: TYPES, default: TYPES.first
  end
end
