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

def on_stage(play:, stage_index:, stage_list_index:)
  puts "[Action] 현재 스테이지 이동 from: #{play.stage_list_index}-#{play.stage_index} to: #{stage_list_index + 1}-#{stage_index + 1}"
  puts
  play.on_stage(stage_index: stage_index, stage_list_index: stage_list_index)
end

# Play
play = Model::Play::Base.last

user = play.user

# 전역 설정
Model.current.play = play
Model.current.user = user
on_stage(play: play, stage_index: 2, stage_list_index: 5)
print(play: play)