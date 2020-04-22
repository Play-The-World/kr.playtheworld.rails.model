module Model
  class Track < ApplicationRecord
    # Relations
    belongs_to :stage_list
    belongs_to :play

    def count_wrong_answer(n = 1)
      update(wrong_answer_count: wrong_answer_count + n)
    end
    def count_used_hint(n = 1)
      update(used_hint_count: used_hint_count + n)
    end
    def count_used_answer(n = 1)
      update(used_answer_count: used_answer_count + n)
    end
  end
end
