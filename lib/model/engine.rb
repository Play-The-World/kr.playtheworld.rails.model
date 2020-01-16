module Model
  class Engine < ::Rails::Engine
    isolate_namespace Model

    # Add a load path for this specific Engine
    # config.eager_load_paths += Dir[Engine.root.join("app", "models", "model", "{**}")]
    # Rails.autoloaders.main.ignore(Engine.root.join('app', "models"))
  end
end
