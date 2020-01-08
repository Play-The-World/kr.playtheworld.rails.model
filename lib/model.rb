# requires all dependencies
Gem.loaded_specs['model'].dependencies.each do |d|
  require d.name
end

require "model/engine"

module Model
  # Your code goes here...
end
