# requires all dependencies
Gem.loaded_specs['model'].dependencies.each do |d|
  require d.name
end

require "model/engine"
require "model/current"

module Model
  # Your code goes here...
end
