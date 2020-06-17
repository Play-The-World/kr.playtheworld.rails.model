# Model::Topic::Base.destroy_all
# Model::TopicInSetting.destroy_all

a = Model::Application.current
t = [
  Model::Topic::Today.first_or_create!(
    title: "오늘의 테마"
  ),
  Model::Topic::Custom.first_or_create!(
    title: "온라인 테마"
  ),
  Model::Topic::Custom.first_or_create!(
    title: "오프라인 테마"
  ),
]
s = a.create_setting!
Model::TopicInSetting.first_or_create!([
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
t[0].super_themes << Model::SuperTheme::Base.first rescue nil

banner = Model::Topic::Banner.create!(
  title: "배너임"
)
banner.super_themes << Model::SuperTheme::Base.first rescue nil

board = Model::Board::Notice.first_or_create!(
  title: "공지사항",
  content: "공지사항 게시판입니다."
)
post = board.posts.first_or_create!(
  title: "플더월 오픈!",
  content: "ㅇㅇ"
)
topic = Model::Topic::MainPost.first_or_create!

s.topics << topic rescue nil
topic.posts << post rescue nil