module Model
  class Track < ApplicationRecord
    # Relations
    belongs_to :stage_list, class_name: Model.config.stage_list.class_name
    belongs_to :play, class_name: Model.config.play.class_name

    def self.serializer
      Model::Serializer::Track
    end

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
