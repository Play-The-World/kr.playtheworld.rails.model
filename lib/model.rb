# requires all dependencies
Gem.loaded_specs['model'].dependencies.each do |d|
  require d.name
end

require "model/engine"
require "model/config"
require "model/current"

module Model
  def self.config
    Model::Config.config
  end
end
