module Model
  class Answer < ApplicationRecord
    # Relations
    belongs_to :stage_list_type
    has_many :branches, dependent: :destroy
  end
end
