a = Model::Application.current
t = [
  Model::Topic::Today.create!(
    title: "오늘의 테마"
  ),
  Model::Topic::Custom.create!(
    title: "온라인 테마"
  ),
  Model::Topic::Custom.create!(
    title: "오프라인 테마"
  )
]
s = a.create_setting
Model::TopicInSetting.create!([
  {
    setting: s,
    topic: t[0],
    order: 1
  },
  {
    setting: s,
    topic: t[1],
    order: 2
  },
  {
    setting: s,
    topic: t[2],
    order: 3
  }
])
t[0].super_themes << Model::SuperTheme::Base.first
