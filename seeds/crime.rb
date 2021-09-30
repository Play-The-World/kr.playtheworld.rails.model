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
  if i >= 5
    c.images.create!(
      value: "https://playtheworld-opengame.s3.ap-northeast-2.amazonaws.com/crime-scene/char/#{i+1}.png"
    )
    next
  end
  c.images.create!(
    value: "https://playtheworld-opengame.s3.ap-northeast-2.amazonaws.com/crime-scene/char/#{i+1}.jpeg"
  )
end

# Maps
gms = st.game_maps.create!([
  {
    order: 1,
    title: '전체 지도',
    width: 1000,
    height: 562,
  },
  {
    order: 2,
    title: '홍변호 방',
    content: '별채',
    width: 2084,
    height: 1165,
    searchable: true,
  },
  {
    order: 3,
    title: '양손님 객실',
    content: '2F',
    width: 1883,
    height: 1150,
    searchable: true,
  },
  {
    order: 4,
    title: '장아들 방',
    content: '2F',
    width: 2045,
    height: 1245,
    searchable: true,
  },
  {
    order: 5,
    title: '정손녀 방',
    content: '2F',
    width: 2112,
    height: 1255,
    searchable: true,
  },
  {
    order: 6,
    title: '박케어 방',
    content: '1F',
    width: 2220,
    height: 1247,
    searchable: true,
  },
  {
    order: 7,
    title: '대저택 거실',
    content: '1F',
    width: 612,
    height: 431,
    searchable: true,
  },
  {
    order: 8,
    title: '장세민 침실',
    content: '1F',
    width: 808,
    height: 430,
    searchable: true,
  },
  {
    order: 9,
    title: '대저택 욕실',
    content: '1F',
    width: 1460,
    height: 902,
    searchable: true,
  },
  {
    order: 10,
    title: '장세민 서재',
    content: '1F',
    width: 2094,
    height: 1271,
    searchable: true,
  },
])
gms.each do |g|
  g.images.create!(
    value: "https://playtheworld-opengame.s3.ap-northeast-2.amazonaws.com/crime-scene/maps/#{g.order}.png"
  )
end

# 전체 지도
gms[0].map_areas.create!([
  {
    title: '홍변호 방',
    shape: 'rect',
    type: 'Model::MapArea::NextMap',
    coords: '116,206,268,39',
    value: '2',
  },
  {
    title: '양손님 객실',
    shape: 'rect',
    type: 'Model::MapArea::NextMap',
    coords: '460,135,283,24',
    value: '3',
  },
  {
    title: '장아들 방',
    shape: 'rect',
    type: 'Model::MapArea::NextMap',
    coords: '487,34,692,131',
    value: '4',
  },
  {
    title: '정손녀 방',
    shape: 'rect',
    type: 'Model::MapArea::NextMap',
    coords: '704,39,887,137',
    value: '5',
  },
  {
    title: '박케어 방',
    shape: 'rect',
    type: 'Model::MapArea::NextMap',
    coords: '14,361,238,549',
    value: '6',
  },
  {
    title: '대저택 거실',
    shape: 'rect',
    type: 'Model::MapArea::NextMap',
    coords: '575,531,281,186',
    value: '7',
  },
  {
    title: '장세민 침실',
    shape: 'rect',
    type: 'Model::MapArea::NextMap',
    coords: '592,181,760,349',
    value: '8',
  },
  {
    title: '대저택 욕실',
    shape: 'rect',
    type: 'Model::MapArea::NextMap',
    coords: '776,187,930,342',
    value: '9',
  },
  {
    title: '장세민 서재',
    shape: 'rect',
    type: 'Model::MapArea::NextMap',
    coords: '601,372,913,533',
    value: '10',
  },
  
])

# Theme
t = st.themes.create!(
  type: 'Model::Theme::Crime',
  difficulty: 10,
  play_time: 120,
  render_type: Model::RenderType::Swiper2.new,
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

td = t.current_theme_data

sl = Model::StageList::Search.create!(
  theme_data: td,
  number: 1,
  game_component: Model::GameComponent::None.new,
  title: '현장 검증 1'
)
s = sl.stages.create!(
  order: 1,
)

eg = Model::EventGroup.create!(
  eventable: td,
  title: '플레이 시작 시'
)
eg.events.create!([
  {
    type: 'Model::Event::SetTrackValue1',
    value1: '600',
    target: sl,
  }
])
eg.conditions.create!({
  type: 'Model::Condition::OnPlayStarted',
  conditioner: td,
})

# level: 1~4, 5~8, 9~10
# Clues
def ci(arr = [])
  arr.map.with_index do |a, i|
    s = ""
    s += "0" if a < 1000
    s += "0" if a < 100
    s += "0" if a < 10
    s += a.to_s
    {
      order: i + 1,
      value: "#{BASE_URL}/clues/#{s}.png",
    }
  end
end

# 욕실

c = st.clues.create!(
  clueable: gms[8],
  type: 'Model::Clue::Image',
  level: 1,
  phase: 1,
  chance: 10,
  unique: false,
  title: '외상 없는 사체',
  location: '욕조 안',
  content: '외상이 없어 보이는 사체',
  hint: ''
)
c.clue_in_characters.create!([5].map { |i| { character: chars[i] } })
c.images.create!([
  {
    order: 1,
    value: "#{BASE_URL}/clues/0002.png",
  },
])

c = st.clues.create!(
  clueable: gms[8],
  type: 'Model::Clue::Image',
  level: 2,
  phase: 1,
  chance: 10,
  unique: false,
  title: '오른팔 화상 흉터',
  location: '욕조 안',
  content: '별 모양의 오래된 화상 흉터가 있다.',
  hint: ''
)
c.clue_in_characters.create!([4].map { |i| { character: chars[i] } })
c.images.create!(ci([3]))

c = st.clues.create!(
  clueable: gms[8],
  type: 'Model::Clue::Image',
  level: 2,
  phase: 1,
  chance: 10,
  unique: false,
  title: '장세민의 휴대전화 1',
  location: '욕조',
  content: '슈베르트의 송어(Die Forelle)를 듣고 있었다.',
  hint: ''
)
c.images.create!(ci([4]))

c = st.clues.create!(
  clueable: gms[8],
  type: 'Model::Clue::Image',
  level: 2,
  phase: 1,
  chance: 10,
  unique: false,
  title: '장세민의 휴대전화 2',
  location: '욕조',
  content: '어제 오후 6시 30분 장세민이 홍변호를 집으로 불러서 만난 문자가 있다.',
  hint: ''
)
c.clue_in_characters.create!([3].map { |i| { character: chars[i] } })
c.images.create!(ci([6]))

c = st.clues.create!(
  clueable: gms[8],
  type: 'Model::Clue::Image',
  level: 2,
  phase: 1,
  chance: 10,
  unique: false,
  title: '젖은 수건',
  location: '욕조 옆 빨래 바구니',
  content: '젖은 정도를 볼 때 몸을 닦은 건 아닌 걸로 추정.',
  hint: '맛을 보니 짠 맛이 난다.'
)
c.clue_in_characters.create!([3].map { |i| { character: chars[i] } })
c.images.create!(ci([7]))

c = st.clues.create!(
  clueable: gms[8],
  type: 'Model::Clue::Image',
  level: 1,
  phase: 1,
  chance: 10,
  unique: false,
  title: '블루투스 스피커',
  location: '욕조 선반',
  content: '블루투스 스피커',
  hint: '뒤에 공간이 있다.'
)
# c.clue_in_characters.create!([5].map { |i| { character: chars[i] } })
c.images.create!(ci([5]))

c = st.clues.create!(
  clueable: gms[9],
  type: 'Model::Clue::Image',
  level: 1,
  phase: 1,
  chance: 10,
  unique: false,
  title: '장세민의 저서',
  location: '책장',
  content: '피해자는 추리소설계의 대가',
  hint: ''
)
# c.clue_in_characters.create!([5].map { |i| { character: chars[i] } })
c.images.create!(ci([9]))

c = st.clues.create!(
  clueable: gms[9],
  type: 'Model::Clue::Image',
  level: 3,
  phase: 1,
  chance: 10,
  unique: false,
  title: '1588 살인사건',
  location: '책장',
  content: '23년 전 발표한 첫 베스트셀러.',
  hint: ''
)
c.clue_in_characters.create!([4].map { |i| { character: chars[i] } })
c.images.create!(ci([10]))

c = st.clues.create!(
  clueable: gms[9],
  type: 'Model::Clue::Image',
  level: 5,
  phase: 1,
  chance: 10,
  unique: false,
  title: '1588 살인사건 내용',
  location: '책장',
  content: '대리운전기사가 어떤 여성을 태우고 쪽지에 적힌 주소로 데려다 달라는 요청을 받고 운전했는데, 알고 보니 그 여자는 칼에 찔려 죽은 상태였고 해당 쪽지는 칼을 산 영수증인것으로 밝혀져서 대리 기사가 살인 누명을 쓰고 25년 동안 감옥살이를 했다는 것이 주요 내용이다.',
  hint: ''
)
c.clue_in_characters.create!([4].map { |i| { character: chars[i] } })
c.images.create!(ci([11]))

# 서재

c = st.clues.create!(
  clueable: gms[9],
  type: 'Model::Clue::Image',
  level: 4,
  phase: 1,
  chance: 10,
  unique: false,
  title: '와파린',
  location: '책상 서랍',
  content: '심장 질환이 있는 장세민이 먹는 약.',
  hint: ''
)
# c.clue_in_characters.create!([4].map { |i| { character: chars[i] } })
c.images.create!(ci([12, 13]))

c = st.clues.create!(
  clueable: gms[9],
  type: 'Model::Clue::Image',
  level: 3,
  phase: 1,
  chance: 10,
  unique: false,
  title: '편지',
  location: '책상 서랍',
  content: '여러 곳에서 온 편지',
  hint: '살벌교도소 1004?'
)
c.clue_in_characters.create!([4].map { |i| { character: chars[i] } })
c.images.create!(ci([14, 15]))

c = st.clues.create!(
  clueable: gms[9],
  type: 'Model::Clue::Image',
  level: 5,
  phase: 1,
  chance: 10,
  unique: false,
  title: '인터뷰지',
  location: '책상',
  content: '<탈옥소년>용 양손님의 인터뷰지',
  hint: ''
)
c.clue_in_characters.create!([4].map { |i| { character: chars[i] } })
c.images.create!(ci([16, 17]))

c = st.clues.create!(
  clueable: gms[9],
  type: 'Model::Clue::Image',
  level: 2,
  phase: 1,
  chance: 10,
  unique: false,
  title: '건강검진결과통보서 1',
  location: '책상',
  content: '장세민의 건강검진결과통보서',
  hint: '피해자는 심장이 안 좋았던 것 같다.'
)
# c.clue_in_characters.create!([4].map { |i| { character: chars[i] } })
c.images.create!(ci([18, 19]))

c = st.clues.create!(
  clueable: gms[9],
  type: 'Model::Clue::Image',
  level: 2,
  phase: 1,
  chance: 10,
  unique: false,
  title: '건강검진결과통보서 2',
  location: '책상',
  content: '장아들의 건강검진결과통보서',
  hint: ''
)
c.clue_in_characters.create!([0].map { |i| { character: chars[i] } })
c.images.create!(ci([20, 21]))

# 장아들 방
c = st.clues.create!(
  clueable: gms[3],
  type: 'Model::Clue::Image',
  level: 1,
  phase: 1,
  chance: 10,
  unique: false,
  title: '고급 RC카',
  location: '진열대',
  content: '장아들의 취미 용품.',
  hint: ''
)
c.clue_in_characters.create!([0].map { |i| { character: chars[i] } })
c.images.create!(ci([24]))

c = st.clues.create!(
  clueable: gms[3],
  type: 'Model::Clue::Image',
  level: 1,
  phase: 1,
  chance: 10,
  unique: false,
  title: '명품들',
  location: '진열대',
  content: '장아들의 각종 명품들. 사치를 부린다.',
  hint: '한 달만에 많은 소비를 한 것 같다.'
)
c.clue_in_characters.create!([0].map { |i| { character: chars[i] } })
c.images.create!(ci([25, 26, 27]))

c = st.clues.create!(
  clueable: gms[3],
  type: 'Model::Clue::Image',
  level: 1,
  phase: 1,
  chance: 10,
  unique: false,
  title: 'DJ 턴테이블',
  location: '책상',
  content: 'DJ 턴테이블. 꽤나 비싸보인다.',
  hint: ''
)
c.clue_in_characters.create!([0].map { |i| { character: chars[i] } })
c.images.create!(ci([28]))

c = st.clues.create!(
  clueable: gms[3],
  type: 'Model::Clue::Image',
  level: 3,
  phase: 1,
  chance: 10,
  unique: false,
  title: 'RC카 설명서',
  location: '책상',
  content: 'RC카 설명서',
  hint: ''
)
c.clue_in_characters.create!([0].map { |i| { character: chars[i] } })
c.images.create!(ci([29]))

# 박케어 방

c = st.clues.create!(
  clueable: gms[5],
  type: 'Model::Clue::Image',
  level: 1,
  phase: 1,
  chance: 10,
  unique: false,
  title: '간호조무사 자격증',
  location: '책상',
  content: '1997년 취득했다.',
  hint: ''
)
c.clue_in_characters.create!([2].map { |i| { character: chars[i] } })
c.images.create!(ci([31]))

c = st.clues.create!(
  clueable: gms[5],
  type: 'Model::Clue::Image',
  level: 2,
  phase: 1,
  chance: 10,
  unique: false,
  title: '심장 질환 서적',
  location: '책상',
  content: '심장 질환이 있는 장세민의 간병인으로서 심장 질환에 대해 공부했다.',
  hint: ''
)
c.clue_in_characters.create!([2].map { |i| { character: chars[i] } })
c.images.create!(ci([32]))

c = st.clues.create!(
  clueable: gms[5],
  type: 'Model::Clue::Image',
  level: 3,
  phase: 1,
  chance: 10,
  unique: false,
  title: '박케어의 수첩',
  location: '책상',
  content: '장세민 간병 수칙이 적혀 있다.',
  hint: ''
)
c.clue_in_characters.create!([2].map { |i| { character: chars[i] } })
c.images.create!(ci([33]))

c = st.clues.create!(
  clueable: gms[5],
  type: 'Model::Clue::Image',
  level: 4,
  phase: 1,
  chance: 10,
  unique: false,
  title: '찢어진 종이',
  location: '쓰레기통',
  content: '어떤 종이가 찢어진 채로 버려져 있다.',
  hint: ''
)
c.clue_in_characters.create!([2].map { |i| { character: chars[i] } })
c.images.create!(ci([34]))

# 양손님 방

c = st.clues.create!(
  clueable: gms[2],
  type: 'Model::Clue::Image',
  level: 2,
  phase: 1,
  chance: 10,
  unique: false,
  title: '기사 자격증',
  location: '책상',
  content: '전기와 용접의 지식이 있다.',
  hint: ''
)
c.clue_in_characters.create!([4].map { |i| { character: chars[i] } })
c.images.create!(ci([36]))

c = st.clues.create!(
  clueable: gms[2],
  type: 'Model::Clue::Image',
  level: 6,
  phase: 1,
  chance: 10,
  unique: false,
  title: '책의 한 페이지',
  location: '옷장 안 바지 주머니 속',
  content: '책 한 페이지를 뜯어서 보관하고 있었다.',
  hint: '1588 살인사건의 내용인 것 같다.'
)
c.clue_in_characters.create!([4].map { |i| { character: chars[i] } })
c.images.create!(ci([37, 38]))

# 정손녀 방


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

# Production용
a = Model::Application.create!(mode: :production)
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
topic.super_themes << st rescue nil
