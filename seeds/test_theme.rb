super_theme = {
  title: "냥토리얼",
  summary: "본 테마는 튜토리얼 테마입니다.",
  data_size: 10,
  play_time: 10,
  content: "[본 테마는 튜토리얼 테마입니다.]\n안냥, %{nth_play}번째 지원자. 이 몸이 드디어 길냥이 생활을 청산하기로 마음 먹었다옹. 내가 내는 테스트를 통과하면 집사로 인정해 주지. 어디 한번 도전해 보겠냥?"
}
s = Model::SuperTheme::Difficulty.create!(super_theme)

s.interpolations.create!(type: "Model::Interpolation::NthPlay")

puts s

