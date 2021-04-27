module Model
  class AnswersBranch < ApplicationRecord
    # Relations
    belongs_to :answer, class_name: Model.config.answer.class_name
    belongs_to :branch
  end
end
