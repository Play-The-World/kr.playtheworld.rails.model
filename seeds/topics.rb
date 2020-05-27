a = Model::Application.current
s = a.create_setting
s.topics.create!([
  {
    type: Model::Topic::Today,
    title: "오늘의 테마"
  },
  {
    type: Model::Topic::Custom,
    title: "온라인 테마"
  },
  {
    type: Model::Topic::Custom,
    title: "오프라인 테마"
  }
])
s.topics.super_themes << Model::SuperTheme::Base.first

puts tl