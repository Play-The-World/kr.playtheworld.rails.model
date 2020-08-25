def print(play:)
  puts "현재 스테이지 목록 표시"
  puts "스테이지 리스트 수: #{play.stage_lists.size}"
  puts "/-----------------------------------/"
  play.stage_lists.each_with_index do |sl, i|
    puts "#{i == play.stage_list_index ? ">" : "-"} StageList #{sl.stage_list_number}: #{sl.title}"
    sl.stages.each_with_index do |s, ii|
      puts " #{(i == play.stage_list_index and ii == play.stage_index) ? ">" : "-"} Stage #{s.id}"
    end
  end
  puts "/-----------------------------------/"
  puts
end

def submit(play:, answer:)
  sl = play.stage_lists.last
  str = "[Action] #{sl.stage_list_number}. #{sl.title} // #{answer} 정답 제출 -> "
  # if play.submit_answer(answer)
  #   str += "정답"
  # else
  #   str += "오답"
  # end
  str += play.submit_answer(answer) ? "정답" : "오답"
  puts str
  puts
end

def on_stage(play:, stage_index:, stage_list_index:)
  puts "[Action] 현재 스테이지 이동 from: #{play.stage_list_index}-#{play.stage_index} to: #{stage_list_index + 1}-#{stage_index + 1}"
  puts
  play.on_stage(stage_index: stage_index, stage_list_index: stage_list_index)
end

user = Model::User::Base.first
user ||= Model::User::Base.create!(
  email: "mechuri@playthe.world",
  password: "123456",
  password_confirmation: "123456"
)

# Theme
# 냥토리얼
theme = Model::SuperTheme::Base.where(title: "냥토리얼").take.themes.take

# Start Play
play = user.play_solo(theme: theme)

# 전역 설정
Model.current.play = play
Model.current.user = user

puts "첫 스테이지들"
print(play: play)

# 정답 제출
on_stage(play: play, stage_index: 2, stage_list_index: 0)
submit(play: play, answer: "곽두팔")
print(play: play)

# 오답 제출
on_stage(play: play, stage_index: 0, stage_list_index: 1)
submit(play: play, answer: "123")
print(play: play)

# 정답 제출
submit(play: play, answer: "231")
print(play: play)

on_stage(play: play, stage_index: 0, stage_list_index: 2)
print(play: play)

submit(play: play, answer: "30")
submit(play: play, answer: "M")
submit(play: play, answer: "냥냥BAKERY")
on_stage(play: play, stage_index: 2, stage_list_index: 5)
on_stage(play: play, stage_index: 2, stage_list_index: 5) # Item 두번 얻어지나 확인
print(play: play)