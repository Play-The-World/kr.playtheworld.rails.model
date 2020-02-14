module Model::SuperTheme
  class Numbered < Base
    def create_theme(params)
      Model::Theme::Numbered.create(params)
    end
  end
end