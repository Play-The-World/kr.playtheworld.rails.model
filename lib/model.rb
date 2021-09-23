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
# require "google/apis/sheets_v4"
# require "googleauth"
# require "googleauth/stores/file_token_store"

folders = [
  'model',
  'extensions',
  'utils'
]
folders.each do |folder|
  Dir[File.join(File.dirname(__FILE__), folder, '*.rb')].each do |file|
    require file
  end
end

# require "model/engine"
# require "model/config"
# require "model/current"
# require "model/pusher"

module Model
  def self.config
    Model::Config.config
  end
  def self.configure
    yield(config) if block_given?
  end
  def self.current
    Model::Current
  end
end
