module Model
  class Track < ApplicationRecord
    # Relations
    has_many :stage_list
  end
end
