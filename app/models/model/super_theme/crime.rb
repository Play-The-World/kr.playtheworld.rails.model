module Model::SuperTheme
  class Crime < Base
    def self.theme_class
      Model::Theme::Crime
    end
  end
end