module Model::SuperTheme
  class Default < Base
    def self.theme_class
      Model::Theme::Default
    end
  end
end