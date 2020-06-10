# requires all dependencies
skip = [
  'google-api-client'
]
Gem.loaded_specs['model']
  .dependencies
  .select { |d| !skip.include?(d.name) }
  .each do |d|
    require d.name
  end

# Google API
require "google/apis/sheets_v4"
require "googleauth"
require "googleauth/stores/file_token_store"

require "model/engine"
require "model/config"
require "model/current"

module Model
  def self.config
    Model::Config.config
  end
  def self.current
    Model::Current
  end
end
