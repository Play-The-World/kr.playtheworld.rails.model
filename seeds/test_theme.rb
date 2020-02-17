super_theme = {
  title: "냥토리얼",
  summary: "본 테마는 튜토리얼 테마입니다.",
  data_size: 10,
  play_time: 10,
  content: "[본 테마는 튜토리얼 테마입니다.]\n안냥, %{nth_play}번째 지원자. 이 몸이 드디어 길냥이 생활을 청산하기로 마음 먹었다옹. 내가 내는 테스트를 통과하면 집사로 인정해 주지. 어디 한번 도전해 보겠냥?"
}
s = Model::SuperTheme::Difficulty.create!(super_theme)

s.interpolations.create!(type: "Model::Interpolation::NthPlay")

puts s.theme_class

t = s.create_theme({
  render_type: Model::RenderType::Swiper.new,
  play_time: 10,
  data_size: 10,
  theme_type: "easy"
})

puts t.class

sl = t.stage_lists.create!({
  stage_list_number: 1
})

puts sl

# sl.stages.create!([
#   {
#     title: "안녕",
#     content: "테스트"
#   },
#   {
#     title: "냥톡을 확인해 봐"
#   },
#   {
#     title: "나의 이름은"
#   }
# ])
sl.stages << Model::Stage::Script.new({
    title: "안녕",
    order: 1
  }) << Model::Stage::Script.new({
    title: "냥톡을 확인해 봐",
    order: 2
  }) << Model::Stage::Quiz.new({
    title: "나의 이름은",
    order: 3
  })

puts sl.stages

slt = sl.stage_list_type.create!({
    component_type: Model::ComponentType::Form1.new
  })

a = slt.answers << Model::Answer::Correct.new({
    value: "곽두팔"
  })

a.branches.create!({
  target_stage_list_id: 2
})







