# Custom Seed

desc "Custom Seed // usage: rails db:seed:file_name (without .rb)"
namespace :seed do
  Dir[File.join(Model::Engine.root, 'seeds', '*.rb')].each do |filename|
    skip = [
      "default",
      "patch",
      "prepatch",
      "set"
    ]
    task_name = File.basename(filename, '.rb').intern
    task task_name => :environment do
      if File.exist?(filename)
        puts "Seeding #{task_name}.rb" if skip.include?(task_name)
        load(filename)
      else
        puts "Could not find #{task_name}.rb"
      end
    end
  end

  task set: :environment do
    Model::Api::Google::Spreadsheet.new(1)
  end
end