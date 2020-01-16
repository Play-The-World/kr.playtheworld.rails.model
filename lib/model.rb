# requires all dependencies
Gem.loaded_specs['model'].dependencies.each do |d|
  require d.name
end

require "model/engine"
require "model/current"

# require 'zeitwerk'
# loader = Zeitwerk::Loader.for_gem
# Dir[Model::Engine.root.join("app", "models", "model", "{**}")].each do |d|
#   loader.ignore(d)
# end
# loader.setup

module Model
  # Your code goes here...
end

# loader.eager_load