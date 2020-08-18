def print(play:)
  puts "현재 스테이지 목록 표시"
  puts "스테이지 리스트 수: #{play.stage_lists.size}"
  play.stage_lists.each do |sl|
    puts "/-----------------------------------/"
    puts "StageList #{sl.stage_list_number}: #{sl.title}"
    sl.stages.each do |s|
      puts " - Stage #{s.id}"
    end
  end
  puts "/-----------------------------------/"
end

def submit(play:, answer:)
  sl = play.stage_lists.last
  str = "[Action] #{sl.stage_list_number}. #{sl.title} #{answer} 정답 제출 -> "
  if play.submit_answer(answer)
    str += "정답"
  else
    str += "오답"
  end
  puts str
  puts ""
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

puts "첫 스테이지들"
print(play: play)

# 정답 제출
submit(play: play, answer: "곽두팔")
print(play: play)

# 오답 제출
submit(play: play, answer: "123")
print(play: play)

# 정답 제출
submit(play: play, answer: "231")
print(play: play)