module Model::SuperTheme
  class Series < Base
    def create_theme(params)
      Model::Theme::Series.create(params)
    end
  end
end