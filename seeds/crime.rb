st = Model::SuperTheme::Crime.new
st.title = '대저택 살인사건'
st.content = '2017년 6월 23일 새벽 서울 외곽에 위치한 호화 대저택의 욕실에서 날카로운 비명이 울려 퍼진다. 욕조 안에 쓰러진 모습으로 간병인에 의해 발견된 피해자는 대저택의 주인이자 추리소설계의 거장으로 불리는 장세민 작가. 사체 발견 당시, 특별한 외상은 보이지 않았는데... 사건 현장을 둘러본 탐정은 사망 추정 시각, 대저택에 머물고 있던 5명의 용의자를 소환한다. 유언장 공표를 하루 앞둔 채 싸늘한 주검으로 발견된 장세민! 과연 그를 죽음에 이르게 한 범인은 누구인가?'
st.summary = '대저택에서 발생한 미스터리한 살인 사건!'
st.save!

chars = st.characters.create!([
  {
    type: Model::Character::Default.to_s,
    title: '피해자의 아들',
    first_name: '아들',
    last_name: '장',
    age: 21,
    gender: '남',
    statement: '평생 아버지의 존재를 모르고 살다가 한 달 전에야 겨우 아버지를 만났는데... 이게 다 무슨 일이랍니까... 아이고~ 아버지!!',
    content: '남, 21세. 무직. 한 달 전, 뒤늦게 찾아 대저택에 데려온 피해자의 친아들. 유일한 가족이었던 어머니를 여의고 혈혈단신 고생하다가 대저택의 도련님이 된 현실판 남자 신데렐라.'
  },
  {
    type: Model::Character::Default.to_s,
    title: '피해자의 손녀',
    first_name: '손녀',
    last_name: '정',
    age: 20,
    gender: '여',
    statement: '제 유일한 가족이었죠. 저를 많이 아끼고 예뻐해 주셨는데... 할아버지가 없으면 전 어떻게 살아요... 할아버지...!!',
    content: '여, 20세. 장아들이 나타나기 전까지는 피해자의 유일한 피붙이였던 외손녀로 금수저 물고 태어나 허영심과 사치가 심한 부잣집 공주님.'
  },
  {
    type: Model::Character::Default.to_s,
    title: '전문 간병인',
    first_name: '케어',
    last_name: '박',
    age: 41,
    gender: '여',
    statement: '작가님께서 좀 까다로운 편이시라... 그걸 맞출 수 있는 사람은 저뿐이었죠. 하지만 모시기 힘들진 않았어요~ 전 프로니까요!',
    content: '여, 41세. 사체 최초 발견자로 15년째 대저택에서 일하고 있는 전문 간병인으로 피해자의 음식, 건강 등을 전반적으로 케어해 왔음.'
  },
  {
    type: Model::Character::Default.to_s,
    title: '개인 변호사',
    first_name: '변호',
    last_name: '홍',
    age: 40,
    gender: '남',
    statement: '작가님께서 워낙 완벽하신 편이라 저는 서포트해드리는 정도로 돕고 있었고... 신뢰가 두터운 편이었죠. 그런 저를 의심하시는 겁니까?',
    content: '남, 40세. 3년째 일하고 있는 피해자의 개인 변호사로 대저택의 별채에서 머물며 피해자의 법적 사항들을 관리하고 있음.'
  },
  {
    type: Model::Character::Default.to_s,
    title: '정체불명의 손님',
    first_name: '손님',
    last_name: '양',
    age: 45,
    gender: '남',
    statement: '작가님께서 새로 집필하는 소설 관련해 자문하러 온 손님입니다. 오늘이 떠나는 날이었는데... 하필 저렇게 되시다니...',
    content: '남, 45세. 피해자의 차기작 집필과 자문을 위해 5일 전부터 대저택에 묵고 있던 자문가(?) 손님.'
  },
  
])

chars.each.with_index do |c, i|
  c.images.create!(
    value: "https://playtheworld-opengame.s3.ap-northeast-2.amazonaws.com/crime-scene/char/#{i+1}.jpeg"
  )
end

a = st.game_maps.create!(
  order: 1,
  title: '전체 지도',
  width: 500,
  height: 500,
)
a.images.create!(
  value: "https://playtheworld-opengame.s3.ap-northeast-2.amazonaws.com/crime-scene/maps/1.jpeg"
)

t = st.themes.create!(
  type: Model::Theme::Crime.to_s,
  difficulty: 10,
  play_time: 120,
  render_type: Model::RenderType::Complex.new,
)

