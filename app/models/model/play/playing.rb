module Model::Play
  class Playing < Base

    # Validations
    validates :finished_at,
      absence: { message: "Finished_at must be nil" }

    # 플레이 완료시 호출
    # 현재 플레이를 변환시킨다.
    # 
    # ==== Return
    # 
    # * Model::Play::Finished
    def finish!
      # data = attributes.except('id', 'status')
      # Model::Play::Finished.create(data.merge(finished_at: Time.now))
      update(type: "#{Model::Play::Finished}", finished_at: Time.now)
    end

    # 정답 찾기
    #
    # ==== Return
    # 
    # * [Answer]
    def get_answers_by(user_answer = nil)
      current_last_stage_list.get_answers_by(user_answer)
    end

    # 정답 제출 액션
    # 다음 스테이지 리스트로 넘어가게 된 경우: true
    # 
    # ==== Return
    # 
    # * Bool
    def submit_answer(user_answer = nil)
      # log("'#{theme.title}'테마의 '#{current_stage.title}' 스테이지에서 '#{team.users.take.username}'유저가 정답 제출 #{user_answer}")

      # 정답들 중 가능한 Branch를 찾는다.
      get_answers_by(user_answer).each do |answer|
        next unless branch = answer.reachable_branch

        wrong_answer_submitted(answer) if answer.wrong?
        go_to(branch)
        
        return true
      end

      false
    end

    def on_stage(stage_index:, stage_list_index:)
      Model::Job::Play::OnStage.run({
        play_id: self.id,
        stage_index: stage_index,
        stage_list_index: stage_list_index
      })
    end

    def use_hint(hint_number)
      hint = nil
      result = false
      message = ""

      if hint = stage_lists.last.hints.find_by(order: hint_number.to_i)
        tracks.last.count_used_hint if tracks.last.used_hint_count < hint_number
        result = true
        message = "힌트 사용 성공"
      else
        message = "힌트가 없음"
      end

      return hint, result, message
    end

    def wrong_answer_submitted(answer)
      tracks.last.count_wrong_answer
    end

    # 해당하는 Branch를 통해 다음 스테이지 리스트로 갑니다.
    # 
    # ==== Return
    # 
    # * Self
    def go_to(branch = nil)
      stage_lists << branch&.target_stage_list
      self
    end

    def go_next!
      branch = current_last_stage_list.get_answer!.branch!
      go_to(branch)
      self
    end

    def playing?; true end
  end
end