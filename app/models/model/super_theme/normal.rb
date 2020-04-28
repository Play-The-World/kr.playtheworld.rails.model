module Model::SuperTheme
  class Normal < Base
    def self.theme_class
      Model::Theme::Normal
    end
  end
end