module Model
  class Track < ApplicationRecord
    # Relations
    belongs_to :stage_list
    belongs_to :play
  end
end
