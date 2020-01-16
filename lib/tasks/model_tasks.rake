# desc "Explaining what the task does"
# task :model do
#   # Task goes here
# end
namespace :model do
  namespace :seed do
    task :test_theme do
      filename = File.join(Model::Engine.root, 'seeds', 'test_theme.rb')
      load(filename)
    end
  end
end