module Model::SuperTheme
  class Numbered < Base
    def self.theme_class
      Model::Theme::Numbered
    end
  end
end