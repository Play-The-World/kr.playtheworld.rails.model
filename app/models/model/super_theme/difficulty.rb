module Model::SuperTheme
  class Difficulty < Base
    def create_theme(params)
      Model::Theme::Difficulty.create(params)
    end
  end
end