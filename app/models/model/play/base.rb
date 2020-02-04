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

      # 현재 스테이지 => Stage
      def current_stage
        current_stage_list.stages.limit(1).offset(stage_index).take
      rescue
        current_stage_list.stages.first
      end
      # 현재 스테이지 리스트 => StageList
      def current_stage_list
        stage_lists.limit(1).offset(stage_list_index).take
      rescue
        stage_lists.first
      end

      # 정답 제출
      def submit_answer(answer = nil)
        # log("'#{theme.title}'테마의 '#{current_stage.title}' 스테이지에서 '#{team.users.take.username}'유저가 정답 제출 #{user_answer}")
        answer = nil # 초기화

        if answer = current_stage_list.answer(user_answer)
          # 1. 정답(Answer)을 찾음.
          case answer.answer_type.to_sym
          when :failure
            # 1-1. 실패 Answer
            # log("오답! 실패 스테이지로 이동")
          when :wrong
            # 1-2. 오답 Answer
            # log("오답! custom alert를 띄우고 스테이지 이동안함")
          else
            # 1-3. 이외 Answer
            # log("정답!")
          end
        else
          # 2. 정답(Answer)을 찾을 수 없음 (전부 정답 or 오답)
          if current_last_stage.is_able_to_all_correct?
            # 2-1. 전부 정답
            answer = current_last_stage.answers.take
          else
            # 2-2. 오답
            wrong_answer_submitted
            if current_last_stage.is_failable? and failed?
              # 2-2-1. 오답입력 횟수 초과 => 실패
              # log("오답! 실패 스테이지로 이동")
              answer = current_last_stage.failed_answer
            end
          end
        end

        # Answer에 대한 공통적인 전처리 부분
        # Answer가 있을 경우
        unless answer.nil?
          # Answer의 events 처리
          answer.events.each do |event|
            event.trigger(self, user_answer)
          end
          go_next(answer)
        end
        # Answer를 반환 => next.js 
        # nil일 경우: 오답 => wrong.js
        answer
      end
    end
  end
end
