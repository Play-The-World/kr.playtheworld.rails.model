module Model::SuperTheme
  class Series < Base
    def self.theme_class
      Model::Theme::Series
    end
  end
end