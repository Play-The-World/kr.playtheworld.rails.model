a = Model::Application.current
tl = a.create_topic_list
ts = [
  Model::Topic::Today.new(title: "오늘의 테마"),
  Model::Topic::Custom.new(title: "온라인 테마"),
  Model::Topic::Custom.new(title: "오프라인 테마")
]
tl.topics << ts
ts.first.super_themes << Model::SuperTheme::Base.first
ts.first.super_themes << Model::SuperTheme::Base.first

puts tl