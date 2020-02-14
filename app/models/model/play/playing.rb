module Model::Play
  class Playing < Base
    # 플레이 완료시 호출
    # 현재 플레이를 변환시킨다.
    # 
    # ==== Return
    # 
    # * Model::Play::Finished
    def finish!
      data = attributes.except('id', 'status')
      Model::Play::Finished.create(data.merge(finished_at: Time.now))
    end

    # 정답 찾기
    #
    # ==== Return
    # 
    # * [Answer]
    def get_answers_by(user_answer = nil)
      current_stage_list.get_answers_by(user_answer)
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

        count_wrong_answer if answer.wrong?
        go_to(branch)
        return true
      end

      false
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
  end
end