# https://namu.wiki/w/%ED%81%AC%EB%9D%BC%EC%9E%84%EC%94%AC3/%EB%8C%80%EC%A0%80%ED%83%9D%20%EC%82%B4%EC%9D%B8%EC%82%AC%EA%B1%B4
BASE_URL = "https://playtheworld-opengame.s3.ap-northeast-2.amazonaws.com/crime-scene"

Model::SuperTheme::Crime.where(title: '대저택 살인사건').destroy_all

st = Model::SuperTheme::Crime.new
st.title = '대저택 살인사건'
st.content = '2017년 6월 23일 새벽 서울 외곽에 위치한 호화 대저택의 욕실에서 날카로운 비명이 울려 퍼진다. 욕조 안에 쓰러진 모습으로 간병인에 의해 발견된 피해자는 대저택의 주인이자 추리소설계의 거장으로 불리는 장세민 작가. 사체 발견 당시, 특별한 외상은 보이지 않았는데... 사건 현장을 둘러본 탐정은 사망 추정 시각, 대저택에 머물고 있던 5명의 용의자를 소환한다. 유언장 공표를 하루 앞둔 채 싸늘한 주검으로 발견된 장세민! 과연 그를 죽음에 이르게 한 범인은 누구인가?'
st.summary = '대저택에서 발생한 미스터리한 살인 사건!'
st.save!

st.images.create!(
  type: :poster,
  value: "https://playtheworld-opengame.s3.ap-northeast-2.amazonaws.com/crime-scene/poster.jpg"
)

st.images.create!({
  type: 'game_map',
  value: "#{BASE_URL}/maps/1.jpg"
})

chars = st.characters.create!([
  {
    type: Model::Character::Default.to_s,
    title: '피해자의 아들',
    first_name: '아들',
    last_name: '장',
    age: 21,
    gender: '남',
    statement: '평생 아버지의 존재를 모르고 살다가 한 달 전에야 겨우 아버지를 만났는데... 이게 다 무슨 일이랍니까... 아이고~ 아버지!!',
    content: '남, 21세. 무직. 한 달 전, 뒤늦게 찾아 대저택에 데려온 피해자의 친아들. 유일한 가족이었던 어머니를 여의고 혈혈단신 고생하다가 대저택의 도련님이 된 현실판 남자 신데렐라.',
    alibi: '전 제 방에서 자고 있었는데요...?',
  },
  {
    type: Model::Character::Default.to_s,
    title: '피해자의 손녀',
    first_name: '손녀',
    last_name: '정',
    age: 20,
    gender: '여',
    statement: '제 유일한 가족이었죠. 저를 많이 아끼고 예뻐해 주셨는데... 할아버지가 없으면 전 어떻게 살아요... 할아버지...!!',
    content: '여, 20세. 장아들이 나타나기 전까지는 피해자의 유일한 피붙이였던 외손녀로 금수저 물고 태어나 허영심과 사치가 심한 부잣집 공주님.',
    alibi: '제가 원래 야행성이라 좀 늦게 자는 편이거든요... 그 시간이면 2층 제 방에서 음악도 듣다 영화도 보다 그러고 있었어요.',
  },
  {
    type: Model::Character::Default.to_s,
    title: '전문 간병인',
    first_name: '케어',
    last_name: '박',
    age: 41,
    gender: '여',
    statement: '작가님께서 좀 까다로운 편이시라... 그걸 맞출 수 있는 사람은 저뿐이었죠. 하지만 모시기 힘들진 않았어요~ 전 프로니까요!',
    content: '여, 41세. 사체 최초 발견자로 15년째 대저택에서 일하고 있는 전문 간병인으로 피해자의 음식, 건강 등을 전반적으로 케어해 왔음.',
    alibi: '작가님께서 항상 2시쯤부터 반신욕을 하시거든요. 저는 나가 있다가 3시쯤 마무리하곤 했는데... 오늘은 평소보다 조금 늦게 3시 반쯤 정리하러 갔더니 이렇게...'
  },
  {
    type: Model::Character::Default.to_s,
    title: '개인 변호사',
    first_name: '변호',
    last_name: '홍',
    age: 40,
    gender: '남',
    statement: '작가님께서 워낙 완벽하신 편이라 저는 서포트해드리는 정도로 돕고 있었고... 신뢰가 두터운 편이었죠. 그런 저를 의심하시는 겁니까?',
    content: '남, 40세. 3년째 일하고 있는 피해자의 개인 변호사로 대저택의 별채에서 머물며 피해자의 법적 사항들을 관리하고 있음.',
    alibi: '일찍 자는 타입은 아니라서... 별채에서 일하고 있었습니다.'
  },
  {
    type: Model::Character::Default.to_s,
    title: '정체불명의 손님',
    first_name: '손님',
    last_name: '양',
    age: 45,
    gender: '남',
    statement: '작가님께서 새로 집필하는 소설 관련해 자문하러 온 손님입니다. 오늘이 떠나는 날이었는데... 하필 저렇게 되시다니...',
    content: '남, 45세. 피해자의 차기작 집필과 자문을 위해 5일 전부터 대저택에 묵고 있던 자문가(?) 손님.',
    alibi: '전 그냥 손님방에 있었죠. 그러다 3시 30분에 비명 소리를 들었고요.'
  },
  {
    type: Model::Character::Victim.to_s,
    title: '추리소설 작가',
    first_name: '세민',
    last_name: '장',
    age: 70,
    gender: '남',
    content: '남, 70세. 23년 전 발표한 <1588 살인사건>이 베스트셀러가 되면서 스타 작가로 등극. 이후 발표하는 소설마다 히트를 치며 저작권료 등 막대한 재산을 보유하고 있던 추리소설계 거장.',
    alibi: '2017년 6월 23일 오전 2시~3시 30분'
  },
  
])

chars.each.with_index do |c, i|
  c.images.create!(
    value: "https://playtheworld-opengame.s3.ap-northeast-2.amazonaws.com/crime-scene/char/#{i+1}.jpeg"
  )
end

# Maps
gms = st.game_maps.create!([
  {
    order: 1,
    title: '전체 지도',
    width: 500,
    height: 500,
  },
  {
    order: 2,
    title: '홍변호 방',
    content: '별채',
    width: 500,
    height: 500,
  },
  {
    order: 3,
    title: '양손님 객실',
    content: '2F',
    width: 500,
    height: 500,
  },
  {
    order: 4,
    title: '장아들 방',
    content: '2F',
    width: 500,
    height: 500,
  },
  {
    order: 5,
    title: '정손녀 방',
    content: '2F',
    width: 500,
    height: 500,
  },
  {
    order: 6,
    title: '박케어 방',
    content: '1F',
    width: 500,
    height: 500,
  },
  {
    order: 7,
    title: '대저택 거실',
    content: '1F',
    width: 500,
    height: 500,
  },
  {
    order: 8,
    title: '장세민 침실',
    content: '1F',
    width: 500,
    height: 500,
  },
  {
    order: 9,
    title: '대저택 욕실',
    content: '1F',
    width: 500,
    height: 500,
  },
  {
    order: 10,
    title: '장세민 서재',
    content: '1F',
    width: 500,
    height: 500,
  },
])
gms.each do |g|
  g.images.create!(
    value: "https://playtheworld-opengame.s3.ap-northeast-2.amazonaws.com/crime-scene/maps/#{g.order}.jpg"
  )
end

# Theme
t = st.themes.create!(
  type: Model::Theme::Crime.to_s,
  difficulty: 10,
  play_time: 120,
  render_type: Model::RenderType::Complex.new,
  play_user_count: 5,
  content: '2017년 6월 23일 새벽 서울 외곽에 위치한 호화 대저택의 욕실에서 날카로운 비명이 울려 퍼진다. 욕조 안에 쓰러진 모습으로 간병인에 의해 발견된 피해자는 대저택의 주인이자 추리소설계의 거장으로 불리는 장세민 작가. 사체 발견 당시, 특별한 외상은 보이지 않았는데... 사건 현장을 둘러본 탐정은 사망 추정 시각, 대저택에 머물고 있던 5명의 용의자를 소환한다. 유언장 공표를 하루 앞둔 채 싸늘한 주검으로 발견된 장세민! 과연 그를 죽음에 이르게 한 범인은 누구인가?'
)

# Preview
t.images.create!((1..9).to_a.map do |i|
  {
    type: 'preview',
    value: "#{BASE_URL}/previews/#{i}.jpeg"
  }
end)

t.images.create!({
  type: 'relation',
  value: "#{BASE_URL}/relation.jpg"
})

# InfoFiles
st.info_files.create! do |i|
  i.type = 'introduction'
  i.value = [
    {
      type: 'title',
      value: '사건 개요',
    },
    {
      type: 'separator'
    },
    {
      type: 'image',
      value: '%{posterImage}'
    },
    {
      type: 'title',
      value: '인물 관계도',
    },
    {
      type: 'separator'
    },
    {
      type: 'image',
      value: '%{relationImage}'
    },
    {
      type: 'title',
      value: '현장 지도',
    },
    {
      type: 'separator'
    },
    {
      type: 'image',
      value: '%{gameMapImage}'
    },
    {
      type: 'title',
      value: '알리바이',
    },
    {
      type: 'separator'
    },
    {
      type: 'alibies',
    },
    
  ]
end

# Topic
a = Model::Application.current
topic = Model::Topic::Custom.first_or_create!(
  title: "#크라임씬"
)

s = a.create_setting!
Model::TopicInSetting.first_or_create!([
  {
    setting: s,
    topic: topic,
    order: 1
  }
])
topic.super_themes << st
