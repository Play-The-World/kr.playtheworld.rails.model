module Model::Theme
  class NumberedTheme < Entity
    def set_theme_type
      self.theme_type = self.theme_type.to_i.to_s
    end
  end
end