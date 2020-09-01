module Model::Team
  class Solo
    # Validates
    # validates ${:attribute}

    def start_play(theme: nil, super_theme: nil, theme_type: nil)
      if theme
        sp = super_plays.create(super_theme_id: theme.super_theme.id)
        Model::Play::Playing.create(super_play: sp, user: user, theme_data: theme.current_theme_data)
      elsif super_theme
        theme = super_theme.themes.find_by(theme_type: theme_type)
        raise "Invalid theme_type: #{theme_type}" if theme.nil?

        sp = super_plays.create(super_theme_id: super_theme.id)
        Model::Play::Playing.create(super_play: sp, user: user, theme_data: theme.current_theme_data)
      else
        raise "theme or super_theme must not be nil"
      end
    end

    private
      def user
        users.take
      end
  end
end