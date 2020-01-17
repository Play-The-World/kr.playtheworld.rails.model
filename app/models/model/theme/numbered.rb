module Model::Theme
  class Numbered < Base
    def set_theme_type
      self.theme_type = self.theme_type.to_i.to_s
    end
  end
end