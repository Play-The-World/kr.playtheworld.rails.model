module Model::Themes
  class NumberedTheme < Theme
    def set_theme_type
      self.theme_type = self.theme_type.to_i.to_s
    end
  end
end