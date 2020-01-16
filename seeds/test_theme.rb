require_relative '_require'
require_relative '../lib/model'
# Dir[Model::Engine.root.join('app', 'models', 'model', "*.rb")].each do |f|
#   puts f
#   require f
# end
# Dir[Model::Engine.root.join('app', 'models', 'model', "**/*.rb")].each do |f|
#   puts f
#   require f
# end

# super_theme = {
#   title: "냥토리얼",
#   summary: "본 테마는 튜토리얼 테마입니다.",
#   type: "Model::SuperThemes::DifficultySuperTheme",
#   data_size: 10,
#   play_time: 10,
#   content: "[본 테마는 튜토리얼 테마입니다.]\n안냥, 254739번째 지원자. 이 몸이 드디어 길냥이 생활을 청산하기로 마음 먹었다옹. 내가 내는 테스트를 통과하면 집사로 인정해 주지. 어디 한번 도전해 보겠냥?"
# }
# Model::SuperThemes::SuperTheme.create!(super_theme)

v = Model::Video.new
p v