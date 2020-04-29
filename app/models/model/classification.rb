module Model
  class Classification < ApplicationRecord
    # Relations
    belongs_to :classifier, polymorphic: true
    belongs_to :classifiable, polymorphic: true
  end
end
