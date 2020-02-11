module Model::Play
  class Playing < Base
    # 플레이 완료 => Model::Play::Finished
    def finish!
      data = attributes.except('id', 'status')
      Model::Play::Finished.create(data.merge(finished_at: Time.now))
    end

    # 정답 찾기 => [Answer]
    def get_answers_by(user_answer = nil)
      current_stage_list.get_answers_by(user_answer)
    end

    # 정답 제출 액션 => Bool
    def submit_answer(user_answer = nil)
      # log("'#{theme.title}'테마의 '#{current_stage.title}' 스테이지에서 '#{team.users.take.username}'유저가 정답 제출 #{user_answer}")
      get_answers_by(user_answer).each do |answer|
        branch = answer.reachable_branch
        next if branch.nil?

        count_wrong_answer if answer.wrong?
        return true
      end

      false
    end
  end
end