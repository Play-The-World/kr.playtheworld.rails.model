module Model
  module Play
    class Base < ApplicationRecord
      # Table Name
      self.table_name = Model.config.play.table_name
  
      # Relations
      belongs_to :super_play, class_name: Model.config.super_play.class_name, counter_cache: true
      has_many :tracks
      has_many :stage_lists, -> { order('tracks.id': :asc) }, through: :tracks
      # TODO stages 메소드 작성하거나 Relation으로 설정하기
      include Model::Clearer

      # 현재 스테이지 => Stage?
      def current_stage
        current_stage_list.stages.limit(1).offset(stage_index).take
      rescue
        current_stage_list.stages.first
      end
      # 현재 스테이지 리스트 => StageList?
      def current_stage_list
        stage_lists.limit(1).offset(stage_list_index).take
      rescue
        stage_lists.first
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
end
