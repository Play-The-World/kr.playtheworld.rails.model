# requires all dependencies
Gem.loaded_specs['model'].dependencies.each do |d|
  next if d.name.eql?('google-api-client')
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
end
