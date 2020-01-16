require_relative '../lib/model'
Dir[Model::Engine.root.join('app', 'models', 'model', "*.rb")].each do |f|
  puts f
  require f
end
Dir[Model::Engine.root.join('app', 'models', 'model', "**/*.rb")].each do |f|
  puts f
  require f
end