module Model::Team
  class Default < Base
    # Relations

    # Validates
    # validates ${:attribute}

    def start_play(options = {})
      if options[:theme]
        sp = super_plays.create(super_theme: options[:theme].super_theme)
        Model::Play::Playing.create(super_play: sp, user: user, theme_data: options[:theme].current_theme_data)
      elsif options[:super_theme]
        theme = options[:super_theme].themes.find_by(theme_type: options[:theme_type])
        raise "Invalid theme_type: #{options[:theme_type]}" if theme.nil?

        sp = super_plays.create(super_theme: options[:super_theme])
        Model::Play::Playing.create(super_play: sp, user: user, theme_data: theme.current_theme_data)
      else
        raise "theme or super_theme must not be nil"
      end
    end

    # private
    #   def user
    #     users.take
    #   end
  end
end