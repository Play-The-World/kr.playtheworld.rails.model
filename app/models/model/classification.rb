module Model
  class Classification < ApplicationRecord
    # Relations
    belongs_to :classifier, polymorhpic: true
    belongs_to :classifiable, polymorhpic: true
  end
end
