$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "model/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "model"
  spec.version     = Model::VERSION
  spec.authors     = ["Play The World"]
  spec.email       = ["info@playthe.world"]
  spec.homepage    = "https://github.com/Play-The-World/kr.playtheworld.rails.model"
  spec.summary     = "Model for PlayTheWorld"
  spec.description = "Model for PlayTheWorld"
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", "~> 6.0.3"

  spec.add_dependency "rails-i18n", "~> 6.0.0"
  spec.add_dependency "globalize", "~> 5.3.0" # https://github.com/globalize/globalize
  spec.add_dependency "enumerize", "~> 2.3.0"  # https://github.com/brainspec/enumerize
  # spec.add_dependency "fast_jsonapi", "~> 1.5.0"  # https://github.com/Netflix/fast_jsonapi
  spec.add_dependency "blueprinter" # https://github.com/procore/blueprinter
  
  spec.add_dependency "devise"  # https://github.com/plataformatec/devise
  # spec.add_dependency "devise_token_auth"  # https://github.com/lynndylanhurley/devise_token_auth

  # Google API
  # spec.add_dependency "google-api-client", "~> 0.36" # https://github.com/googleapis/google-api-ruby-client

  spec.add_dependency "mysql2"

  # Authorization
  spec.add_dependency "rolify" # https://github.com/RolifyCommunity/rolify
  spec.add_dependency "pundit" # https://github.com/varvet/pundit

  # Async Job(ActiveJob)
  spec.add_dependency "sidekiq" # https://github.com/mperham/sidekiq
end